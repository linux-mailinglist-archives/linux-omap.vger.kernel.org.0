Return-Path: <linux-omap+bounces-4603-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D92B48816
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 11:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FA0417548B
	for <lists+linux-omap@lfdr.de>; Mon,  8 Sep 2025 09:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CA52F0C6E;
	Mon,  8 Sep 2025 09:16:39 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE42ED16B;
	Mon,  8 Sep 2025 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757322999; cv=none; b=ekar4QmQ58EEr3e1j4knghdRjZBqWTLdsZzJBz6e239tZ0Z3y4vuoV/RsiexSsAfPAf2QbaWRQW1VI8Me8BVnSqLMDwHb0PLnv0laY07tqrvVKmjpaavBOhJ4n3nZisUqKKlVz7uAp1q/9FuMpbjvX0KsskvIhGs04d5Vq+oyCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757322999; c=relaxed/simple;
	bh=ecPPMnaRPIM+bYNrrPzU6QuGowwAFWwGNSSC3c2mWoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ByVFA+84U0a1cb26WkrHPT3UQ2l1IKQy4hUXyPw6k7OuKOCkMUiAyjlZowcW6oy/mjh8pclAFPKstHzPstPrfOJTcoPnNQzC3UQJylNb+h/RBxxvHrW9NHm8BM7B2ey6NoGPYw/MC7xvudKpJL306xRtqY1vqMePdDs9BVYXQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 82469cbe8c9411f0b29709d653e92f7d-20250908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:362d1ff7-467a-43a9-935c-6d62cfb7ac08,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:6f743686b177cd0b2ef1f647a16908d9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82469cbe8c9411f0b29709d653e92f7d-20250908
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 532145651; Mon, 08 Sep 2025 17:16:31 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 3BE43E008FA3;
	Mon,  8 Sep 2025 17:16:31 +0800 (CST)
X-ns-mid: postfix-68BE9EEF-2433684
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 03BACE008FA3;
	Mon,  8 Sep 2025 17:16:21 +0800 (CST)
Message-ID: <6683fb5a-64f4-433e-a22b-153b01dfa572@kylinos.cn>
Date: Mon, 8 Sep 2025 17:16:21 +0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup
 helper
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
 <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/9/6 04:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Fri, Sep 5, 2025 at 3:24=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   drivers/acpi/processor_thermal.c | 52 +++++++++++++++++-------------=
--
>>   1 file changed, 27 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor=
_thermal.c
>> index 1219adb11ab9..460713d1414a 100644
>> --- a/drivers/acpi/processor_thermal.c
>> +++ b/drivers/acpi/processor_thermal.c
>> @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
>>          return 0;
>>   }
>>
>> -static int cpu_has_cpufreq(unsigned int cpu)
>> +static bool cpu_has_cpufreq(unsigned int cpu)
>>   {
>> -       struct cpufreq_policy *policy;
>> -
>>          if (!acpi_processor_cpufreq_init)
>>                  return 0;
>>
>> -       policy =3D cpufreq_cpu_get(cpu);
>> -       if (policy) {
>> -               cpufreq_cpu_put(policy);
>> -               return 1;
>> -       }
>> -       return 0;
>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
>> +
>> +       return policy !=3D NULL;
>>   }
>>
>>   static int cpufreq_get_max_state(unsigned int cpu)
> The changes above are fine and can be sent as a separate patch.
>
>> @@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>>          return reduction_step(cpu);
>>   }
>>
>> +static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acp=
i_processor *pr)
>> +{
>> +       unsigned long max_freq;
>> +       int ret;
>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
>> +
>> +       if (!policy)
>> +               return false;
>> +
>> +       max_freq =3D (policy->cpuinfo.max_freq *
>> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction=
_pctg)) / 100;
>> +
>> +       ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
>> +       if (ret < 0) {
>> +               pr_warn("Failed to update thermal freq constraint: CPU=
%d (%d)\n",
>> +         pr->id, ret);
>> +       }
> But this silently fixes a bug in the original code which needs to be
> documented with a Fixes: tag (and it would be better to fix the bug
> separately before the using the __free()-based cleanup TBH) and
> introduces some whitespace breakage.

Thanks!

 =C2=A0I=E2=80=99ll follow your advice and handle the Fixes tag and white=
space issues.


>> +
>> +       return true;
>> +}
>> +
>>   static int cpufreq_set_cur_state(unsigned int cpu, int state)
>>   {
>> -       struct cpufreq_policy *policy;
>>          struct acpi_processor *pr;
>> -       unsigned long max_freq;
>> -       int i, ret;
>> +       int i;
>>
>>          if (!cpu_has_cpufreq(cpu))
>>                  return 0;
>> @@ -120,20 +134,8 @@ static int cpufreq_set_cur_state(unsigned int cpu=
, int state)
>>                  if (unlikely(!freq_qos_request_active(&pr->thermal_re=
q)))
>>                          continue;
>>
>> -               policy =3D cpufreq_cpu_get(i);
>> -               if (!policy)
>> +               if (!cpufreq_update_thermal_limit(i, pr))
>>                          return -EINVAL;
>> -
>> -               max_freq =3D (policy->cpuinfo.max_freq *
>> -                           (100 - reduction_step(i) * cpufreq_thermal=
_reduction_pctg)) / 100;
>> -
>> -               cpufreq_cpu_put(policy);
>> -
>> -               ret =3D freq_qos_update_request(&pr->thermal_req, max_=
freq);
>> -               if (ret < 0) {
>> -                       pr_warn("Failed to update thermal freq constra=
int: CPU%d (%d)\n",
>> -                               pr->id, ret);
>> -               }
>>          }
>>          return 0;
>>   }
>> --

