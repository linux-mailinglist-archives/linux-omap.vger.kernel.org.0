Return-Path: <linux-omap+bounces-3066-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D83A0839A
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 00:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385B9165295
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 23:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186432063D4;
	Thu,  9 Jan 2025 23:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HaxFR3JR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC31FF7DA
	for <linux-omap@vger.kernel.org>; Thu,  9 Jan 2025 23:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736465869; cv=none; b=vDste3/dTgQBFS6AgR0mgpCG1zIDXDLiLPvctoDXT4IWHq2/lfg+cA81dokmYL66IyIE9kElNvVerFdje3UL+vbfH2I0Um2sgMpO0NLluy3OmDGL8cyiHgMfDKMUgY0B0N3s1r3ZQwPjkLM+1gkMynCw4weGQrWxx1MhVVRvB4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736465869; c=relaxed/simple;
	bh=pLAZdElQQ+Klq45pGY/ZtKByOFB1tdiPuTmXgIET2nY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X09BvXeq7nHF7Info+smeYP+0et/KBtoYNA133feohJn/+TS4Q1kgpBDR0/ndBNc0xlstIj3Do3d4X7pcq6ncx1/df0fwu7eOn683DV4xR/HfTO7GTRajVYMtrf/rt5IqZ3gnreugBPq/63s7JV/BQ2D60PTvKYklzQdPognIW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HaxFR3JR; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21675fd60feso31760795ad.2
        for <linux-omap@vger.kernel.org>; Thu, 09 Jan 2025 15:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736465866; x=1737070666; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9XPKCT8QhEaC9tNgTUGx1mSYdmp6MzCOvuxEB6mhcY=;
        b=HaxFR3JR0XZUywXT3vosy/oqAMUZzgV+mUFwC4IYYB1FE5QlsSV9BYZbxJIgGhChiX
         X/xvIO+7cWL4hYQe1nfHSUHjjThIJMSZG7FotIeC5m1KNWLQ33MCl3lJmGuFTsArmsXs
         YPcb2x4j2HyfSIsO/lsQNLfWRLPERnHak5pbow4iZLMCskxHeAmXr6rlelXS78/v+7o4
         UxwMl3ScO8BzcOXs46ni4A6IdiGf0ct79Md29TtF/Ck/2UsLOkJzJeX45wxtEFP+VAGC
         unV2DLxKJpkr3xwPGGrSEQG4gLdfpz3BkzpRYscQo7bju4mNogpQwRiArrGbmTyoK0Xb
         8VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465866; x=1737070666;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9XPKCT8QhEaC9tNgTUGx1mSYdmp6MzCOvuxEB6mhcY=;
        b=F/AQwW+YnVpg+2d+d8f2f1qW9ZpBqQRhAVWh/jctpb/Enpp3KY4SwxEYEksoFsObEg
         wruDWnVytP3ssxziLHD46raFfCAasrN+0w/JuJrjMID4GXUVEaRcc3o3Y6HgiaFVbtgz
         l7/BgN5NUlQTcRuBWFDiyY2BMD7DvSQFGGk0DCiCWeOoQgLelttrgqRh2adKC5g8jZI4
         VpFT1E6NrNeXfDf1EzVoqw5+Zw/UQHoaAyeVnD1QojzxiSYNhEoqX/zFedKqU2CyhgD7
         lSEHfRJlgM/9iqSxYVMh2XWhGRebvxM7cmYlBa04KKBuWW+DLYQGZE+fyDABy0AbFQ04
         xv3w==
X-Forwarded-Encrypted: i=1; AJvYcCUUaS/5ES76tJuTdpQHPiG+rkXEq7P82RLgXN7KXHVBIoZzEu7tNq6Ke+dGwjq0aL6U9bFTg9F8SsGM@vger.kernel.org
X-Gm-Message-State: AOJu0YxWli33ubCQOAe8V9tuRBinsKrP6NLi3H+hU73A6RSYkmOVuhzn
	GpoaQj61L7ofxltP33WlwrxulWDyT5eI1QiJO539e2OA94ayWpfDST+bo0NF64o=
X-Gm-Gg: ASbGnctGKVTIWvP/+sSAEhSlzCBbyPev1Aubiqc/KWQ/3V+WvwqViRJdYBb0hgjVIt3
	nv5ynxRGFj4dE8NXDm4DbaHEDYA10DE8ET8BAmXLc9Niy/GgH6CvVUDJCD56fUHltVYFCdDAxr4
	5dA8su0GR4mWN74uyLSW+kCjSHbseNjs8AYbtr0NSVeOxS7oxtVSAKNigdOe6WowDyPcYiM1tOq
	PZcWyNkPVmk2AfwVx+VFbcKbljeDpVYb4+wblmDw/9SF2cO6JHF4E8=
X-Google-Smtp-Source: AGHT+IEfEBVr03htPuKk7GnouY1uEKaeksFavfal49FWtSio2uOLv2gDake8CxsSp5RKbe2PLBGoTA==
X-Received: by 2002:a17:902:ce11:b0:216:49b1:fadc with SMTP id d9443c01a7336-21a83fe4b7amr134857165ad.42.1736465866394;
        Thu, 09 Jan 2025 15:37:46 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219330sm3186745ad.132.2025.01.09.15.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:37:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm/omap: drivers: updates for v6.14
In-Reply-To: <20250108091348.46f71e35@akair>
References: <7hcygyb3yi.fsf@baylibre.com> <20250108091348.46f71e35@akair>
Date: Thu, 09 Jan 2025 15:37:45 -0800
Message-ID: <7hldvj8som.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> Am Tue, 07 Jan 2025 15:26:45 -0800
> schrieb Kevin Hilman <khilman@baylibre.com>:
>
>> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
>> 
>>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>> 
>> are available in the Git repository at:
>> 
>>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/drivers-signed
>> 
>> for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:
>> 
>>   Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)
>> 
>> ----------------------------------------------------------------
>> arm/omap: drivers: updates for v6.14
>> 
>> ----------------------------------------------------------------
>> Andreas Kemnade (1):
>>       Input: tsc2007 - accept standard properties
>> 
>>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>> 
> This is input, the only reason that is goes via soc to keep that
> togother with
> ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

Correct, it's going through my tree after agreement with input
maintainer, Dmitry.

> So shouln't it go via your dt branch?

Since the dependency is not a strict build dependency, I separated into
dt and drivers like I normally do.  They will both land in the same
upstream release, so should not cause any problems.

Kevin

