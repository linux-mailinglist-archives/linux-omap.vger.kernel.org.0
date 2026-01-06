Return-Path: <linux-omap+bounces-5338-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A56CF6B15
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 05:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D559630116F4
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 04:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8051129BD81;
	Tue,  6 Jan 2026 04:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lq+X02uY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4171B4244
	for <linux-omap@vger.kernel.org>; Tue,  6 Jan 2026 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767675101; cv=none; b=epLOC5izgZDMLHxTofBo5GzYVNn9p5hstb1z9TNC9kP1uu3wFNSerWwEKJ0cCZD10xfuBXr1oezIkn8rPUwIqHkKG1p/5+Di8D5fYNC58BUdSKm2KKa98A/05EwHvzwn5bzzj6qTJd2bkws1q1HCYrqFUKIOXhzc2ghNgtAmnfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767675101; c=relaxed/simple;
	bh=UlmB8aofFX+aBjyxbkeG7dNTDd6mRcjsRhEhjAKR9SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4j7kaAwUmj6kHEGnnFo6oIxNc75O6Vl3nfYhX+5eneKhW+0HbCh3z9F+ZtdJt4egB1mMf4NTYRQAgb4N94M7CHD/QnJBE2X20c3Dvca6KV7kYea3jXUUY50ueAZt+w5xHRt5J99t2JJYJsFG/ZrtRYL/vjoPzc1NIz+P9J1oDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lq+X02uY; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso559346b3a.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 20:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767675099; x=1768279899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjphLqaIHXVtilGhXjAX8dxDJ/NLDN5LrccIsr/6nyw=;
        b=Lq+X02uYzFn6FAGUkqLI8GwH5VTXeYrE8XDpCczrr9bagYsBDaL/PFL7Wg+fNILeXG
         Va656oMfKWAGbhuL9K1TUqFLm6sb53ACnPPn9L+3sRCQnquVJH9DRULI6lb7aIr77Dqd
         aykgBoFGW6hcJfXVstPAzSj/S1qc/OZx2D20OEkOjMThzZ4/giPtNMCsKnPYjpHs8VyK
         o1kzHm4IKPpS3esXyca/UnfhR7qRIjghiHsBdtY5QmAPSizIKab2HiZ8OI6ulDQdo9sw
         Yj+2Hka2+soZ+cR8ExBmSYY8531+vEleP4yQm4L5rri6+O10jfYNFUUEFZt2arQFZMLM
         Ff6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675099; x=1768279899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjphLqaIHXVtilGhXjAX8dxDJ/NLDN5LrccIsr/6nyw=;
        b=dOq/tdM58r0tHpR/AYSsA3jEJ0VDm32Rig50r2yBsqUd70PSRSwEcaN91Kykzfeofs
         KOVz1u+oOckUHiV3wYi9YkpTLWKgdhPnxq0lKZNCRmmEQbRYBCwbev/3AI4Qp7RNqamo
         g5pb8pC3v9ufQsawQ8K/eVeBQdYvn0EdfAdR4q1FbRcXoQOtkpvcaM6OQYF6fwekU8OJ
         vBkhJWyNjieJMwlyO8LOYwYN4qIbVzB9yZc6sZNglUu4onGWkJ0feTSFu6/OfAkILStD
         DhONl2y1VMVRhTGzrKRlZEZ5hUapkLbtdkQ4T+YSix4reeUipftYnI6mo65Hubf0WhAi
         hHog==
X-Forwarded-Encrypted: i=1; AJvYcCXTIiClwSusM/TWI0a7Dkuk3kk1+T/rPfRqBeny+rIqfqublHa4GjF7KWoNBwU3rjTkrZV6qJ7fRYns@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzki/2zpF2h2Km0aWfFRITdYTItY63b8aZnRCOV9WG9tp0Gih+
	4KH5qgutO6EsoWVpxHQWFWg2URZo0+/q5hRTJ47D8tLKm/AEIjAdQZNIYRvNu2VllI8=
X-Gm-Gg: AY/fxX7HSYKq4uiC9UjMzCd0RyY/LQcIwnwOu4UdLo8lovic8ufdxPsXXFh2+AO9/+o
	q1Xel0+ZDqlvPI770F/VGttcgiH2kCO6QiFn1HdSNVwjLStYb6ALrb+60B1tb2gLwhLefdXwRhS
	zhcN9M+MnSi+7W6cuHNyeBsKQVupt/xQsFhLv8DqbG6LDCoBS+c2M7dl8h3Kz9vErcTeMLT1diu
	eAE5M3qRHGd3DTn/ewd1/3QoHtckVDvdVvBkZO79rje3YRVhCB5ziQYt7GwxyZi6ENPqK3+UmT/
	ltuOZ+w07nnyJgvftUZz6eohJQ0MqRMCQzly71eeCHnH40N5WpBdCv9Pvw18lSzaa29sS36tnYe
	CTp4+LGVMpooOCzfkhVw5s6GYaeqpVMlN3Jvp+KybzAItkV38Fx+0l1Ei7DBM9pKmRg7f1uymCR
	SNOmyeA9A/D90z+lRLf1DJeg==
X-Google-Smtp-Source: AGHT+IGPOMmk4ggw5KdOaZITHTcrBWtSYR9foQUpiyM6fqhTRbsCSNMCtOzpDSehnY+CUrQG9BI5yg==
X-Received: by 2002:a05:6a00:4ac9:b0:7b8:10b9:9bec with SMTP id d2e1a72fcca58-8187ded5625mr1459726b3a.19.1767675098909;
        Mon, 05 Jan 2026 20:51:38 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52fd904sm707094b3a.33.2026.01.05.20.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 20:51:38 -0800 (PST)
Date: Tue, 6 Jan 2026 10:21:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: andreas@kemnade.info, khilman@kernel.org, rafael@kernel.org, 
	linux-omap@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: OMAP: Fix resource leak in probe error path
 and remove
Message-ID: <5t3aovkbk4oziiddabpvlmdksllwi55uqycnktweu56fj7ts7f@eszra6duc6ya>
References: <20251215030327.1771-1-vulab@iscas.ac.cn>
 <20260105131253.2692-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105131253.2692-1-vulab@iscas.ac.cn>

On 05-01-26, 21:12, Haotian Zhang wrote:
> The current omap_cpufreq_probe() uses regulator_get() to obtain the MPU
> regulator but does not release it in omap_cpufreq_remove() or when
> cpufreq_register_driver() fails.
> 
> Add the missing regulator_put() in the remove function and in the
> error handling path of the probe function to prevent resource leaks.
> Also ensure the mpu_reg pointer is set to NULL after release to avoid
> dangling pointers.
> 
> Fixes: 53dfe8a884e6 ("cpufreq: OMAP: scale voltage along with frequency")
> Suggested-by: Andreas Kemnade <andreas@kemnade.info>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> 
> ---
> Changes in v2:
>  - Revert to using regulator_get() instead of devm_regulator_get()
>    to ensure immediate release of unusable regulators and
>    safer handling of the global mpu_reg variable.
>  - Add explicit regulator_put() in omap_cpufreq_remove().
>  - Add error handling for cpufreq_register_driver() in probe.
> ---
>  drivers/cpufreq/omap-cpufreq.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

I have left some feedback on the previous version. Lets continue the discussion
there.

-- 
viresh

