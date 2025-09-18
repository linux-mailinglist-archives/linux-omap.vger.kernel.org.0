Return-Path: <linux-omap+bounces-4396-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB680B3B2CB
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 08:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3202A7A4823
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 05:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAAB1A5BBC;
	Fri, 29 Aug 2025 05:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p514Sl+B"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC4202987
	for <linux-omap@vger.kernel.org>; Fri, 29 Aug 2025 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756447190; cv=none; b=K0fh+aBYOVDettQr61A4SrqmpwF65dsr0sXoquQSW6iM1M/dgpEMYR2LXVEn7syTy8VNpWjQDSUPjsm8/f3ofpPgyvbNqGytTCNe1UqgBAQ9wN3ejaT3HMefnLGLc4zs2ArXWTK1+dqvTpva1GQ4EDtt4G5KmKmb9HzpDnki1Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756447190; c=relaxed/simple;
	bh=3Us6gLaZK2VccDGA6IMnqvs0nFzgbS6I49Q/8l1+6ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjJj/y72cyuez4dkU/yWpJr3vnrGPyrdHROaN5mIRiGHUQDWV70qnvjusJRf73KRmxrtUsp9qQjQ7TvXdjetX6U8CAr6i4WCltu86ID7v2+nP7Q42YDO4fhFhDAKqyeQIWpFT7NaaeiDbmS/vt2u76IG8Mfu8s8mEPvQqheD5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p514Sl+B; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-772301f8a4cso174766b3a.3
        for <linux-omap@vger.kernel.org>; Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447188; x=1757051988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=p514Sl+BuFb2jJ5R5DjvdPuZbJD/3N094aXwj3h0r/jhqjJ8E7yP+k817tMndGWuRR
         FJyrpnjrOC1v44RKZW8+hYv/s/oQyyrlN51j6gPDRgosyonW7nobHk+dEVSc4NB36Yw4
         PuqLoIM2bQWrSvT363c+fY0yOV3vZSKbC+7dp3aQmV8szSfmyrtVMuT0C6uReUSabLLQ
         QNCTGNg39LLVhpXBLI27D+yN4JWIztFIMPiYxMxgFB1nTSvmERBka41rfpTaGJms0EBS
         6QVx0xOpRrajJT7Gzpak3rJcIdO5m+Vx4yWFoMbU026CqovfiV44HAzTUMYSrkn9uYWg
         J/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447188; x=1757051988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=ay1bN6f7ZzTdF4JwVhpZF9+2ZfWx0PDlVhZKOC0SIAGw+b+CECjlJj1eBlnfkTxfkY
         11kKMUWSL7GOfe/nbaGboz0WdsNTD5gICFMHY/gwLpo9AMCHEXar/3LkIefVFX9688f6
         OV4YUoZoOOJlYcC3cs4AX8RI1Jd1dlM1+7xJpjQsaf7sn1VpjnyQC7ypmiekVv1NNf8M
         JdYPlOTmvxctSuMOSXXMbZatX+WOwwx2n3PBKFizdI9GGIkO51ht/3i4cp6cdkGTPEDX
         GJqykbuxqaOROquBOIuhmhpAujgWPFjlOYFO7JCpv27QIOEq3UbQEU4hqR+tMzdPBAed
         VmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3YwYPDwTlPm8CYTJWU5tGzBJhiDyG77sDvhaACIOJIeQL8XPapm/h/wPPpSVoQQ2z1RYENh63QKnz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rf5ZLwfGaOn9Hkr/BjIsuAKioCeWmQLb/+z1F+AAEhhJ+Fw9
	CBU5YCQuX63Nwb8q+Jj3izyDRY4EoEN7tX7jORK7+OpVNpfNQLEXsjZ7v9hogmgimmA=
X-Gm-Gg: ASbGncsAopRhJoJc4nJzFqqj3xkZu6RNFf6GfOEFynEKV+y9IP0l/1nOBpPzpSbUkdg
	nimNo+EQrzNov+SSlyK5/TH0flUPRG1kOaSyckDa/oTDWKU4ko/qrXxlZsUHyEupYhAVbCpTS2S
	rwWTt+AxRTqeon3Eu6qQHay1bSvaXXTuEs0upGNXvXmY5DYinhju+ggc3KECPyJnQ0Wa3MDyfeo
	150746x0ZgHh4zrTszog8llUw/5SV8m7TkuzuwnzXPjoPPipS/cXomPaFuqJLPJgzlJxXW5PRYz
	dT+WR+l4l6BnhGHHo6pJwFjKgDH5qIvJuHBg7ly8ktzoHvT/JgVF1rJK9UhcK+ud86v7UMk24Ha
	9tvUnIlOTQaDeiOTJjOB0TGKwd69dFBoVq4s=
X-Google-Smtp-Source: AGHT+IFsar3WOaSA9RKNM7TPFf9gG0iXTxdUF2CW8raU1SyelgEQswrlDbapLb2rA7PUFkb3M17NCQ==
X-Received: by 2002:a05:6a00:10d5:b0:772:2850:783d with SMTP id d2e1a72fcca58-772285079c4mr3285667b3a.22.1756447188084;
        Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b14c1sm1263485b3a.31.2025.08.28.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:59:47 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:29:44 +0530
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
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-5-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh

