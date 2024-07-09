Return-Path: <linux-omap+bounces-1744-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08392AD04
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 02:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B08AB2170A
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 00:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77983139F;
	Tue,  9 Jul 2024 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I4ezVadx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4712FA34
	for <linux-omap@vger.kernel.org>; Tue,  9 Jul 2024 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720484032; cv=none; b=HLWm6DEkQp120M7t9NwyHHPNVwlkGf8gk4ZIckorNlOX0kS9w/boCRU7rBPDedDRPOs1YoZWePM7O+4AOdlV+IDYApb9NygZpeAs/KozDXiyVqQ5g8AmkuKtGtawcN6IJj3ESPRZt3DdaUTCXvQXEf6nRgbJLRqq/LxPKIpyxao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720484032; c=relaxed/simple;
	bh=jCEm882SQslRgIBXsQn1kxrkykzNfCqulLb5W/QPZOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UMIUEv/+mOvXfSBG+/Zlb38c3HY5C0AW3p3/0isHPGT1tNFE8p6d4R31GuBa7jkGXg0yeENnUMoHgD0NaZEqNSsPKBHMIj4L0N6s84Emv1A8EY0xhPZZ3MaXE4RgmDiVFJLCAmnOvYiofLILhP9KzoT34Z/8hfr3rsRyD1DTVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I4ezVadx; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso2639154a12.0
        for <linux-omap@vger.kernel.org>; Mon, 08 Jul 2024 17:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720484029; x=1721088829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ht8VsBOkepq5zsjawGUoItW8opG98EOdGF+KrcqtpU=;
        b=I4ezVadxpOmDhCZWDWhmniYXfjHBYdtWnRLkEMpMBZU7IMAMPWuQcYwNK+uhbxM7rM
         J8gyLdlDcsdTnle06RNJntcsg86+zLG9eqhErO/ASNpVBXmYwkO111w8xDJy8zGnOtlU
         EiZL/XaltPd8sLZbpxCy1MBQ4ZnH+rv/pvLJTQYOcXuDgP/+q+MzFEz5Ebd5ANgCEkFt
         IsSgXyGYd1YQCNdtuJ+16FvMpetzNWIYZcL2EYD3EOYwNxq9v+u1BdQGRn4CFzeLbcxt
         pLBWbgtR8u4VvBaJSG6IcwqX/6t4pfI+JLHCgDnDkkR3Y8m7LhzT0CUollzZlSHFgkCD
         P6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720484029; x=1721088829;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ht8VsBOkepq5zsjawGUoItW8opG98EOdGF+KrcqtpU=;
        b=iUB4KR3ZWKAsDLcrbI0j7LKit+PEaTDinKhI5ahf1neksYD7PfP2R8PlxsmNb2KMiN
         7gP8hcmgEY0dDARM9yPrMkqLNWlng0fC6IBC2rgmSkzS+g/aYm2N+CV4fcB0GQeOkShV
         fRVegb8/ggd+cgKfmooJHILowZnZGHiGusNEQv36WjWF56JP1bSCz9xzc6s0GbPh6MCI
         6eLY+hChbeHP8pI1e+ub2AIMvE77ZYQ3ch+Hk4K5gyiE9j7svORToYiFgW1XJdqdcApg
         4m7gCFWEUUu6SNPiFcCvHt1+ozRQrvPg1hfBExkwcMAP3K+4XfKZBJZcTMd9De4T03Lp
         QeZg==
X-Forwarded-Encrypted: i=1; AJvYcCVTGOcaO6iRMDPP2i6BTwbom5kHfH2foIRrlKU2e1tnHjc+5AA/258Rrk7EITstzZcKPNE1J1uEhFaZj43WZ12TUFxL0h/fTyYzLg==
X-Gm-Message-State: AOJu0YxrtytZK5Khp4dH+Wf62gtORL75kG6dD1nAEo/sbIXtXgTj1xoC
	fgveEa/AdVrX4vgwUr3vM3JL2T2Q9PBuEzmysURGkJIMnH8zCvlGKGLdXQgKU20=
X-Google-Smtp-Source: AGHT+IGkWCCkWN2IpjJSaXA3XjI+bvmXyOSILAUhGaY1m2ht96DWj5nBOIO/mZVcokj6IO0IX3nQwA==
X-Received: by 2002:a05:6a21:78a9:b0:1bd:a048:7fcc with SMTP id adf61e73a8af0-1c2984c9eb4mr1004308637.46.1720484029558;
        Mon, 08 Jul 2024 17:13:49 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad3837sm4238665ad.300.2024.07.08.17.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:13:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>
In-Reply-To: <20240606165104.3031737-1-andriy.shevchenko@linux.intel.com>
References: <20240606165104.3031737-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ARM: omap2: Switch to use kmemdup_array()
Message-Id: <172048402893.4046096.641938212436686822.b4-ty@baylibre.com>
Date: Mon, 08 Jul 2024 17:13:48 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Thu, 06 Jun 2024 19:51:04 +0300, Andy Shevchenko wrote:
> Let the kememdup_array() take care about multiplication and possible
> overflows.
> 
> 

Applied, thanks!

[1/1] ARM: omap2: Switch to use kmemdup_array()
      commit: ea77ad3d2dccaf223c556886b067c5e2657b40aa

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


