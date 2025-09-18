Return-Path: <linux-omap+bounces-4398-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE043B3B316
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 08:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03CF3461825
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 06:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B25223311;
	Fri, 29 Aug 2025 06:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="flKqZX05"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D561F09B6
	for <linux-omap@vger.kernel.org>; Fri, 29 Aug 2025 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448000; cv=none; b=LaX5thbgu33u+04gCMxXIxqLNTNCUbu7nF7xch1v1HZ8ga0YeeZHDC8uoS4OVLmP/bdvxLkgBlpEPBIqIeZacQDLi3i5A1I5osNrgjWH4LwMWaWj/aqroOj6ED+wV2+MWheDFrLzjp5adGaWMJo3SIPAbJbv/jccBoUOQM9lpdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448000; c=relaxed/simple;
	bh=ME3U1EvqRDpeRv8iU5ieehT4bOumrWu/AM01apJTyWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGNrw1qEVcbFgWoKRJ+TMkDXI8zWEGH8THP5aMGXOujQG5RfSRKfa3eeaY0B5yvK5I5c6XHI9BwJHzlq+LpkhL7KCLHCxf/5Ho0OtMktlemRcnwcVsbULhq6Z8FACXAeoKOj5rfRlFEl6Wq2Aktfnh9S6gc4YWXO9/KGgexsxhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=flKqZX05; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24457f581aeso14775215ad.0
        for <linux-omap@vger.kernel.org>; Thu, 28 Aug 2025 23:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447997; x=1757052797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
        b=flKqZX05+50sa/v7L26xkuDxUTGPnqFYxY7+DsKe80BonZ0SS7nVFJ10puk86edNWU
         gJodVrddYyKLwUZ5Dsgr9g0H2+qFZM8RE/3JD419Tnc4l8NEuiFlpX+4rUNEyQbSlFAX
         eYDUPVB1I/RuqE7P4H1mHWjglPQztCBhc0WqbxPqqDKJn5LwvjdAx487V/70nFnqkEMr
         KVTgHmo9yGibCoyvQf+tUHIo3HKG3GZHnx225J/zaA1NEl0suhP3j6lBfa6v5p6SfUYz
         8v/BRORln/QmTnV8JaqwzCCujak8+thiSvHA1fVruNcMxX8KKwDAuA6fSACD0KUWF+1r
         MvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447997; x=1757052797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
        b=hflJri0MaQq+zWyHPAIXAUB79pw9FammHLg6lGpFxGk9fLmbSovQuxG6o27ZzqYi7D
         JFzDOySlK6va3Q2mzM1S6T6NhU67vWyHvHW7GDwv6aKBwq0WfWFymA80uyFQ/NYu1roS
         FxJu/zV2t1XXQkCKEJNLMoNMoTUimN8rXp+3j9C7ciuD+73DoCuSqC6y9fqA56t8RUkJ
         5jSi3gkY/CQKWiFcd+X1a39XnaTaZ88kst2IqUPRR195yWCCmiJ1jCH0ijafoFVOqK/m
         8zXuH0rLAlQCDH/derifCPOkin3w6j3LSB1+HtFpsP1rsDX+NkhZoN2WJ2krqHgShtR1
         A0AA==
X-Forwarded-Encrypted: i=1; AJvYcCVC4xHYRAbAk7b8jTDoFFEF3AKsXLRXzKub54VTurT2tqATRG1TgLDHXWsdR/mvb9O8VIur7t1Gs+Zr@vger.kernel.org
X-Gm-Message-State: AOJu0YwhtY3l4BwTPzhLBLe1Fqpn/AadONpVtaN2mh7Cbmm6CZBxGNTA
	4kigZAxlXjcc6g0h+VxWZ993yq+rhUmDWDNnqxsW3Ej9k/ESRVXbsyjjzVEC7GoM/A4=
X-Gm-Gg: ASbGncuEP74i6FreemkveuySAEehZWVDPyQmKl29jraU6s2VHvNf9GeBNY8QzjGgVo3
	D8bC/z/4Q3mi071GYLfgE+m0sce3XxecWCgoSgXcccirY5D2Q5t2b/OKUD01+WW4AlToalL90LD
	PFOJDM2sVq9pFcdWcPkFagzEBKkuSXrc7n6byQWiLkYW9ms3zqZgcJivOm0lODEChDmUsXOX3dH
	1gM/oJ3JJeQxeNZQ3UttcHhwnykzo4e95DexfW8VdRc9wUmwp1rcy8LIwxkq9rmW7QaRTdJ7gF3
	lwqrcVbKdDPA4kKshYT6UFIkMKjTzGTryL4djif2st8hwDwg++/P6Miz/+qfmMLcvm7JqhEGegc
	rHk+O5h7760G1Wa/Malb0cuWP+paQ1PNrLUs=
X-Google-Smtp-Source: AGHT+IFWh4jzpCyQazo33Du3vwJOQK6BMtgUKuJSYiyNvSKeAM+9t6q52OKXzZUwBWVIjDVwh5LnnA==
X-Received: by 2002:a17:903:248:b0:248:7018:c739 with SMTP id d9443c01a7336-2487018c906mr177164055ad.28.1756447996693;
        Thu, 28 Aug 2025 23:13:16 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490658999fsm13362715ad.112.2025.08.28.23.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:13:16 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:43:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/18] cpufreq: s5pv210: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061313.bloyct5htjym6b3j@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-11-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-11-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index 76c888ed8d16..95f1568e9530 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -555,7 +555,7 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  						 unsigned long event, void *ptr)
>  {
>  	int ret;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  
>  	policy = cpufreq_cpu_get(0);
>  	if (!policy) {
> @@ -564,7 +564,6 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  	}
>  
>  	ret = cpufreq_driver_target(policy, SLEEP_FREQ, 0);
> -	cpufreq_cpu_put(policy);
>  
>  	if (ret < 0)
>  		return NOTIFY_BAD;

Merged with minor change:

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 95f1568e9530..4215621deb3f 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -554,10 +554,9 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
                                                 unsigned long event, void *ptr)
 {
+       struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
        int ret;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);

-       policy = cpufreq_cpu_get(0);
        if (!policy) {
                pr_debug("cpufreq: get no policy for cpu0\n");
                return NOTIFY_BAD;

-- 
viresh

