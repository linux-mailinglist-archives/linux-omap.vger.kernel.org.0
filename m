Return-Path: <linux-omap+bounces-4557-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AD2B453AA
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 11:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E86188FA7B
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 09:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E68D286433;
	Fri,  5 Sep 2025 09:45:30 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19C11F1921;
	Fri,  5 Sep 2025 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065530; cv=none; b=KmXn3tEfqZFbxVqxwfi2lqIvhjubv4wLQau8Da8rcSb6Kw+R6KdxkzYTWtVXpJ8JaaNwrSP60Rx3t63n3XRv7iETE+MkKweu9ilm0Jkux7D8jIo5DMJCYz8drFGMl3bOnNfKcE349SUnAIkN3sMwIvw0cc/0pz40m06yI6q0Kio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065530; c=relaxed/simple;
	bh=hgtWHOJIG0twbTzJciZ5EeRWSECU0oVSjJZzyubEtzI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9jXiNPcI8lyVYx6wm+Q7cLVcreI7eJ+FxtGgqAcuTZPTyLdEHJ+xPwcl96+grOw5HSbEyR99S9aSY7uezmfbhbJmRdOgKyJwLxBIYcc2V+SZycw9OxCBtgpYdj2cz3NOgUa/Dk3YrbUEgwW1C7AKOCC29EqKiQLjefJR+FU6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJBGj5KWJz6GFrx;
	Fri,  5 Sep 2025 17:42:53 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C6DA11402F7;
	Fri,  5 Sep 2025 17:45:24 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 5 Sep
 2025 11:45:22 +0200
Date: Fri, 5 Sep 2025 10:45:21 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Zihuan Zhang <zhangzihuan@kylinos.cn>, Viresh Kumar
	<viresh.kumar@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham
	<myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, "Jani Nikula"
	<jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, "David Airlie" <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, Eduardo
 Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan
	<ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui
	<rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, Lukasz Luba
	<lukasz.luba@arm.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
	<festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, "Sumit Gupta"
	<sumitg@nvidia.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep
 Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
	<linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<imx@lists.linux.dev>, <linux-omap@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] ACPI: processor: thermal: Use scope-based
 cleanup helper
Message-ID: <20250905104521.00003944@huawei.com>
In-Reply-To: <CAJZ5v0j5O4Q72P-OLiR4RK4g8E5joi_gu_O4HZymh9hJvy551g@mail.gmail.com>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-3-zhangzihuan@kylinos.cn>
	<CAJZ5v0j5O4Q72P-OLiR4RK4g8E5joi_gu_O4HZymh9hJvy551g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Wed, 3 Sep 2025 15:23:31 +0200
"Rafael J. Wysocki" <rafael@kernel.org> wrote:

> On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.=
cn> wrote:
> >
> > Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> > annotation for policy references. This reduces the risk of reference
> > counting mistakes and aligns the code with the latest kernel style.
> >
> > No functional change intended.
> >
> > Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> > ---
> >  drivers/acpi/processor_thermal.c | 37 ++++++++++++++++++--------------
> >  1 file changed, 21 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_=
thermal.c
> > index 1219adb11ab9..5043f17d27b7 100644
> > --- a/drivers/acpi/processor_thermal.c
> > +++ b/drivers/acpi/processor_thermal.c
> > @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
> >         return 0;
> >  }
> >
> > -static int cpu_has_cpufreq(unsigned int cpu)
> > +static bool cpu_has_cpufreq(unsigned int cpu)
> >  {
> > -       struct cpufreq_policy *policy;
> > +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cp=
ufreq_cpu_get(cpu);

I'd put the order back as it was.  See docs in cleanup.h, it is fine to
declare local variables inline if they are being use with __free()

That way if the simple check on acpi_process_cpu_freq_init fails no
get needs to occur.

So something like

static bool cpu_has_cpufreq(unsigned int cpu)
{
	if (!acpi_processor_cpufreq_init)
                 return 0;

	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cpu_g=
et(cpu);

	return policy !=3D NULL; //Personally I find !! on a pointer a bit weird :)
}

> >
> >         if (!acpi_processor_cpufreq_init)
> >                 return 0;
> >
> > -       policy =3D cpufreq_cpu_get(cpu);
> > -       if (policy) {
> > -               cpufreq_cpu_put(policy);
> > -               return 1;
> > -       }
> > -       return 0;
> > +       return !!policy;
> >  }
> >
> >  static int cpufreq_get_max_state(unsigned int cpu)
> > @@ -93,9 +88,23 @@ static int cpufreq_get_cur_state(unsigned int cpu)
> >         return reduction_step(cpu);
> >  }
> >
> > +static long long cpufreq_get_max_freq(unsigned int cpu)
> > +{
> > +       long long max_freq;
> > +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> > +               cpufreq_cpu_get(cpu);

Format consistently.  If you are going to wrap to 80 chars here
then do it for the cpu_has_cpufreq() line that is identical to this.

> > +
> > +       if (!policy)
> > +               return -EINVAL;
> > +
> > +       max_freq =3D (policy->cpuinfo.max_freq *
> > +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction_=
pctg)) / 100;
> > +
> > +       return max_freq;
> > +}
> > +
> >  static int cpufreq_set_cur_state(unsigned int cpu, int state)
> >  {
> > -       struct cpufreq_policy *policy;
> >         struct acpi_processor *pr;
> >         unsigned long max_freq;
> >         int i, ret;
> > @@ -120,14 +129,10 @@ static int cpufreq_set_cur_state(unsigned int cpu=
, int state)
> >                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)=
))
> >                         continue;
> >
> > -               policy =3D cpufreq_cpu_get(i);
> > -               if (!policy)
> > -                       return -EINVAL;
> > -
> > -               max_freq =3D (policy->cpuinfo.max_freq *
> > -                           (100 - reduction_step(i) * cpufreq_thermal_=
reduction_pctg)) / 100;
> > +               max_freq =3D cpufreq_get_max_freq(cpu);
> >
> > -               cpufreq_cpu_put(policy);
> > +               if (max_freq =3D=3D -EINVAL)
> > +                       return -EINVAL; =20
>=20
> Please also move the code below to the new function so it does not
> need to return a value.
>=20
> >
> >                 ret =3D freq_qos_update_request(&pr->thermal_req, max_f=
req);
> >                 if (ret < 0) {
> > -- =20
>=20


