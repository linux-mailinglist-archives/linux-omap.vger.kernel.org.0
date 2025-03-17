Return-Path: <linux-omap+bounces-3403-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF7DA65C7C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Mar 2025 19:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6A63B207A
	for <lists+linux-omap@lfdr.de>; Mon, 17 Mar 2025 18:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE40D1B4232;
	Mon, 17 Mar 2025 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hRi7e4y7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A37EED6
	for <linux-omap@vger.kernel.org>; Mon, 17 Mar 2025 18:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742235964; cv=none; b=lfCnNk2/oLs9lf0vzPn0CSMWJU8t9BVgdSgWvkBpUAIke1SlnUznENKL2b4+qMPM8l5SF5z8EleRn/BiLKifFTqBZ+ocWFa6EP08GjL9uQILZJnpFLUHn5dRjUpjaW40lz7glOZFq8yLAOVxWUj+1sOUk3rqCp+MfRun6YFO4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742235964; c=relaxed/simple;
	bh=J/mr4I3uvI8W0Y1yAOw9cp7AhbUIUPwgEeg0HhkM+Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=thD3X23XBitkTPRoC6LQiB6lEmrexlC2jof6dzHOx7TGMdLtyNiUe/I+bAbbsFw3OB1e+jt7i93oluCKw5pQolfoWF7fFmdIEC/3UBqRuVgIktOsELyAzxxquztUecCrHEdPv9eLpOsKseP6PDLTktPKCOKZpRlmCfax5qqkBzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hRi7e4y7; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so2848590a91.2
        for <linux-omap@vger.kernel.org>; Mon, 17 Mar 2025 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742235962; x=1742840762; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rYoO63O9hT+LgEGrGAhIiJ0zo/hJCz6kwWX13GuFt04=;
        b=hRi7e4y7sVZr9z5ledzNGML2SUUWg8BzxJVhiN7/NXs7iUVR71EO4JVL4CA+tp9mYS
         Mh5iQXsZrPd1wdLj0zHpfc4lONb1cCinWNqwI/Mxb5QhjmgnXyA61KoDPxdR6sOZACqQ
         qed350UFkKY+cPbTuQpL3HCqepd2mSlSk42wstwejdAX6NUgP4zttCkWYnWLzXZql6bX
         k1mh7oqAHv2yw0bma5pc7oXq1N6+GXm0zkcaE0u1vHVOsgNaBWoq9o0DgQ5ou50eSHtO
         8eP5TYLQ3nm0e2RRYevZhUWn2qUugcPy0uQogZaXd3T0FzgfidPFdT0HNYMBd8pJsTgw
         zIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235962; x=1742840762;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYoO63O9hT+LgEGrGAhIiJ0zo/hJCz6kwWX13GuFt04=;
        b=n8MkS0jMpykWc/VHnbj00HnVF1CtRzviLMposZnpKHKX1AKDNtTWxyKLnWkv9YhLGZ
         dcEYPvpQj4DH5tdGYgSyOkYvaizrQg6zBHGFY50lezlTMmHtYTV/r/naU+QveUdwUneR
         CVXwrRzLfAauJNiqBA9AC+WkiIUBj+XYz+0G1FStRZVRnPOeCQ3X30xHQr1yDilPUw4s
         50oMHT1IiW1sm4cTRHF8xr91y5HTrpBGGnxHbDd8OXou6MEYQZavsEuDXKXwjzd1lCWV
         qEKxAt7XpGGTYjzBXUwYcXwUeH4uXMemUjBIXIU9mpSvjQNevp5YNcnMzmqb0RCjUjPf
         kPjA==
X-Gm-Message-State: AOJu0Yzk2QXX15dq1v6y0V2vQSfYLRa3Z7mk0qTl5PwLQxHyoygw9F6f
	uRS3WLZpHUEk7craUsHReTfYjf6Faw/WGMztZDrdq1t+MHCCHBU9h7v+YRyl/sQ=
X-Gm-Gg: ASbGncu5/lNjOgxhOsMN3nvoZY0ohyf7OVTvV2+7YCab4qFClKO6m+hQwGVGN2LvnOt
	rFFxGXw6BPmJZG/8Z29aPb6+/9CIoC/SG74JlN3XCTn4SlqmXsausyGdiGxknDb8UmQfOIWzUJG
	diPKjXTCK3IKDmM8pmNAPApeHGm8YofSOlnQD7gU0JVsy/istUg2qFad6fUK22bc/ERC3dgpgTo
	mDm38m+KsvCdb13CkZMCsjzOpK4Wkt/V6qJiEtZheHolVnclSHJysVmx6Ouwy0RKWdtzF7n+mrN
	kFQvKjzRwarfW1W17cCwzU8DqFZkEyH5eNyzJ//UWgY=
X-Google-Smtp-Source: AGHT+IGDo7UUMQx0KC2YYaD2K5Kwkp8RdeTOtJ+4dyeCTYAd0srXw/4KjI/PQ4Ty5nvijUZdv54Y0g==
X-Received: by 2002:a17:90b:2cc8:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30151cb4ab1mr17747816a91.2.1742235962013;
        Mon, 17 Mar 2025 11:26:02 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301534f47e4sm6410538a91.3.2025.03.17.11.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:26:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: OMAP1: defconfig updates for v6.15
Date: Mon, 17 Mar 2025 11:26:01 -0700
Message-ID: <7hcyefqzt2.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/soc-signed

for you to fetch changes up to c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca:

  ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP (2025-02-05 16:31:37 -0800)

----------------------------------------------------------------
ARM: OMAP1: defconfig updates for v6.15

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP

 arch/arm/mach-omap1/Kconfig | 1 +
 1 file changed, 1 insertion(+)

