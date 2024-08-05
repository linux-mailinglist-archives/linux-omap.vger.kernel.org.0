Return-Path: <linux-omap+bounces-1838-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF6948061
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 19:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F411C21EBD
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 17:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A4A15EFB9;
	Mon,  5 Aug 2024 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hoNPu7KV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2BC481B9
	for <linux-omap@vger.kernel.org>; Mon,  5 Aug 2024 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722879419; cv=none; b=t/ufupjIAZSHvvh/pgIpta78wuyg1Qo6yrrtGykjQYOExbrdBDn2PZfvOAxmK3ej8eskgz6XW8j2X0ckefu6DavrOplhMRs+cv1QE2P3QAslQ/5NQXHvzMcp98z5A1fzuxyRc7bk9bCXQuqC8D892RRpwP+voo8rKCLTUYj38WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722879419; c=relaxed/simple;
	bh=DA4369ep4aRCQk372N75Nbh4WuAp1GA6UZSDUFqv2dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W2V6ri+5WxBOOWzGMxmWCxcCtTayxvLYfDv7ZZx8JU5oVI7CyFN8xWLbwuSmW7ZmX9VxQsc0yPOIBv+Um/7UkQyuHbVSlbfszI+m0+g3z9/liwhzz9uX4NHyGBteosah1w3ZSdDtIZ3UdBynMoPjd53Uz8CqCTje5x4UsWeP0CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hoNPu7KV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d19d768c2so8050322b3a.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Aug 2024 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722879416; x=1723484216; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=goLTI1Me9QFdEbbxVvS9O2vJ+EscEBdu5wB58pG03Vg=;
        b=hoNPu7KVe16tyK3HBS81ej5DinAgGit+Kh8aCXz+Keu/Rhzg3R9cKFO2+78BTZfPm0
         Ka82pTZOA89HEH8lXkEDlh3T0jn+YMXIvFfvYq7idyo8BXWwknaouZopTd0WNmSv+xEF
         PJqQifvgnFSaKRz5R/+7qcQn2R5aDn0Rru7Rc6/jqKO3frQKSv9Q3moG6mdYy3fAqKEb
         KSj6ynx3EnpqmRSgkGd7guqdknnjP9GdnvhJxyrNahdyWvNP+NV8ZrtOr/O85VtQ3N3C
         zpXSqx+wR6kHSUkc2PfS00kmW/HRh/j0nqWUg8vgC/zSlythBW86GO7tp4ve6uv0bo96
         Jbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722879416; x=1723484216;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goLTI1Me9QFdEbbxVvS9O2vJ+EscEBdu5wB58pG03Vg=;
        b=sNZVWs0YbzxNYNzVgRyhVuap6GHWYwXCuZOTwhBQo75KxyRweTQqDb4NU8IkH9ZoNR
         8HXXw6jUKyQ2zIE2Amg2Hq8gr2hJaoydEMu/Ac7m5X98gkPwdRmz8JwPTF9oF0iGAta1
         LdE2OBN9YE9tluRSsBcXy7LqjQ5qfmb7OdWdYsT0UCmKeAxNdem32cFQyTK+H/aQ1DiS
         s2EOw3kiWjHPkCJ2ZSFJUTd7blgB5LSwdhIgJov6izEFXjJiPvnW8EURTMKJ0HNYGmFl
         hAE0WomqY9p0N2ZLj87rZgLRFA1k6v5pvXt1e5+tng2fvGSmQT9M7GaAA2E2yWet02+L
         BFew==
X-Gm-Message-State: AOJu0YwAjhLcTnpadaNqxEfmIfngMRqcvAnc1oLffudd9upBSBHFJlhZ
	KcoD9xP/LsIY6DDvo9RFq8Z2T3ooOkq/Jqr6oC9VrNkk0WA+IHQ3iNekTyWEm6OLQM8RPk3BkMP
	yT7s=
X-Google-Smtp-Source: AGHT+IEPsJOZd0kXjvfZc+Q2Cp9lgQmjHsAvWtcR1BuMvVvN70ionSp87ecT9lwzcXMvoxWe9CNzPA==
X-Received: by 2002:a05:6a21:3383:b0:1c3:ff33:2472 with SMTP id adf61e73a8af0-1c6996a5f4emr11522868637.51.1722879416615;
        Mon, 05 Aug 2024 10:36:56 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecfd196sm5665573b3a.161.2024.08.05.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:36:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Roger Quadros <rogerq@kernel.org>, "Rob Herring (Arm)"
 <robh@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: Use of_property_present()
In-Reply-To: <2ff177ed-a5e8-46ad-9902-14f377033da2@kernel.org>
References: <20240731191312.1710417-1-robh@kernel.org>
 <2ff177ed-a5e8-46ad-9902-14f377033da2@kernel.org>
Date: Mon, 05 Aug 2024 10:36:55 -0700
Message-ID: <7hy15a3m88.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Roger,

Roger Quadros <rogerq@kernel.org> writes:

> On 31/07/2024 22:12, Rob Herring (Arm) wrote:
>> Use of_property_present() to test for property presence rather than
>> of_get_property(). This is part of a larger effort to remove callers
>> of of_get_property() and similar functions. of_get_property() leaks
>> the DT property data pointer which is a problem for dynamically
>> allocated nodes which may be freed.
>> 
>> The code was also incorrectly assigning the return value to a 'struct
>> property' pointer. It didn't matter as "prop" was never dereferenced.
>> 
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed by: Roger Quadros <rogerq@kernel.org>

just FYI, missing a '-' in your Reviewed-by, which means tools like b4
will not spot it.  I added it manually this time cuz I happened to
notice it was missing.

Kevin



