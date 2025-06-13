import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insighta/features/therapy/logic/get_therapist_cubit/get_therapist_cubit.dart';
import 'package:insighta/features/therapy/logic/get_therapist_cubit/get_therapist_state.dart';
import 'package:insighta/features/therapy/ui/widgets/therapy_card.dart';

class TherapyListView extends StatefulWidget {
  const TherapyListView({super.key});

  @override
  State<TherapyListView> createState() => _TherapyListViewState();
}

class _TherapyListViewState extends State<TherapyListView> {
  @override
  void initState() {
    super.initState();
    context.read<GetTherapistCubit>().getTherapist();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTherapistCubit, GetTherapistState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text("No data loaded yet.")),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (therapyResponse) {
            return ListView.builder(
              itemCount: therapyResponse.payload?.length ?? 0,
              itemBuilder: (context, index) {
                final therapist = therapyResponse.payload?[index];
                if (therapist != null) {
                  return TherapyCard(therapyModel: therapist);
                }
                return const SizedBox.shrink();
              },
            );
          },
          error: (error) => SizedBox(
            child: Center(child: Text('Error: ${error.message}')),
          ),
        );
      },
    );
  }
}
