Return-Path: <linux-omap+bounces-4397-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CA6B3B2E9
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 08:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3371BA4955
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 06:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BBC22A7E4;
	Fri, 29 Aug 2025 06:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+jD0xnE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395F7404E
	for <linux-omap@vger.kernel.org>; Fri, 29 Aug 2025 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756447474; cv=none; b=Adq4wE1BvZk9k6c8Z2Phe/KK87lhZyls5I/d6gR3Y4teBXC72pDKwcO25hXe6P016o1bRAals/ptyJLwEpaujYBT8lUtzDjtH9K6xDbZwa/QjUZIJWL3izCECMvOnCAPGSGZ/IxOArsbUVjlDqKeL3u56dWSnHyvSO4FYyPFIhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756447474; c=relaxed/simple;
	bh=R1W3jiVVzxWYPVNevFrweFrVDinP+HnDaHhtFMQbjkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDB5geUnTSn1eeukGKSxLlg9WaeW9FeqCR6s3ad77PeNNrYslwe7uC0mjIWzSoipwLOUdoFLM+SZTxDFA2XI3vVLt4wNVdh0RSR5NXwF+FDIQ6nTmAYyHmtUNt6ss9vwDk5PwDNazn9+fSVjjH4J06HCQoJae7NtcUJwXYK8InI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+jD0xnE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32326e09f58so1802969a91.2
        for <linux-omap@vger.kernel.org>; Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447471; x=1757052271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
        b=m+jD0xnE7GCiAkVAglKtXgcoX3DOtHjH5eJ/z12vQ0EUPug5ettryEbC3i3fXOYDbJ
         N1IPvxbY/20L7KAESc27kBg0702VvpxufywHsy+jF6i8lkVIvbsD0e4WXBnYfcThsNVf
         qrR7ODR2Ezt301nRkjRBGWwq+BykggUireqxIV7YMSbyq6ZwzMf+IOoPu2OARBm+avFI
         Dx/cLaSXe7biClDWbnAm77v9zp2p4lYbs58a1/uI4d3NVD48TppfogVjMUPmtuF4PbNc
         sBU5VbgYUP8bTNaL5KGGGjEzZusvDO0rtZSCRAUnxDnwnl0djNz9D+5ZGB9P2z3gYbRs
         iWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447471; x=1757052271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
        b=GrFjyAIuT276p8mdLxlXZQSZDsu50j+ebYO4AjmtN2vym32bSE3kunGYrrHSZHxsVa
         XQPfT9LPFKnFC5EJJBn6cQjdrlp8YGd/vbUHuGRwt31GR8Aw59Mwj226RPtivyNKdrmW
         2lVSKnc3vkZSEIV8lsDi0uYURF1iLBB6BE9bPvpCF9AhQGEvz4OPtDLK/Wc5h1xJ7NJn
         8l7BlNRV5OAule3jsTuvuhG6xrIPny2VgPRUGLA9bR39+/Ffchyyb1Coojs/8E8Sg2MK
         xq1mcmyhbQpNtNB26C5RTpm2tFpMA6BVL5M56d201A3ovUciBrlj2b1KrN8bayoUgua2
         1Gbw==
X-Forwarded-Encrypted: i=1; AJvYcCXMBMeTHtNVPlio+CVh46rjm7I7J11I3tJOAfTwOKBrdyO8qejXsNwpjBz+YtIm4UwRNpz3fmuOFj9S@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ZNlTqBL5TqBb/lu0o+Jes/iGaGwuJZlLUga5fKLkpctSCAXe
	0AT2KmmF2zZYPfyZ8RMXUddQg3pP7BlS9PDJuawNz9xg1ee70RFlMTEpode9jJQXDDo=
X-Gm-Gg: ASbGnctOAfeVshVKLBsOQqo4k08Ch9q6ate7MviXpw2NLL6HcL0ZJRkjiURZt4VcbqD
	U3x25R7f7jgQ/7oSLtLXmsb69YkFINs9WZDGZjiEv2R6vCh5UGyDWKOcEdcQOpzpvVhKPz/l4Ko
	JzkhcaFvdD9uA06nWqo4WwQ2eC3peAlrhT9zJ4DjhL1Uw+vF6O0izn8VOMpMQMNLOIVm0t30I5l
	SIRDJXjCTaUaGSFSjW/ubkMnxtHDW2X7JfCnJolBuesLNbDqkISXAryclGQXtASFWNFvG489ZMI
	cSu+C8UBaLgZX6ZSfbYGhH1+oqkqMH2ZgUuHTC8bXjr8peJ0Tb5lCnLwPS5HmWW92OKriEg/D40
	bUT1tkVJLx3gcQzj4Vn+dGQjt
X-Google-Smtp-Source: AGHT+IHJm0ouStNvxO+mrh5P3XbGCZbjhM83KCGZEDW+lDzAXYoH2OUF1pt2Xet0QmziR4vBgyThHQ==
X-Received: by 2002:a17:90b:4ec7:b0:31f:42e8:a896 with SMTP id 98e67ed59e1d1-32518b8233amr31504637a91.34.1756447471082;
        Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57ab9esm7074127a91.4.2025.08.28.23.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:04:30 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:34:28 +0530
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
Subject: Re: [PATCH v2 05/18] cpufreq: CPPC: Use __free(put_cpufreq_policy)
 for policy reference
Message-ID: <20250829060428.aoo4wlp67celupv5@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-6-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-6-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/cppc_cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh

