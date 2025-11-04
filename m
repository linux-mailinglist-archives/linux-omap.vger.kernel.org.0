Return-Path: <linux-omap+bounces-4842-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B190C3354A
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 193953BEA23
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D466333B6F1;
	Tue,  4 Nov 2025 23:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ci9ZQeUP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F7313E14
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297618; cv=none; b=hGJgwQheRFZ/ww8J8g9fHGyUhsc0T0RjIEiDpARo4ULXQThu/yO+Vz471ACio5qFweMxPwgc4zYgzKnarRd8sLdWKG0y6RDPYa7iJgOmuCl0VIh6E4XW8/FWBK6P2HJG9pHEpLjBPxBXRCbPQI5kClqP3Leff9MBC7n5YCaw4Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297618; c=relaxed/simple;
	bh=ZGRT0kJ3GnYiHyk2ecZl6aJAaG4buZDetewqGejT/zU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hNFNjQziCbhu94cI3qYcTzUx9+WGEwv3JQIpdjJD6ENtV9/AfcGR/rBp6Q+PTWkYgTNIRF25lonQVnEMDFMqqXzs7JyuIKPfRlKz5tTwHvl1cngSFTaM+sIG4Kc8AiVQybZMqejbGa9LnuMBpOrhDoVXtBguIFtUQC6qaK3OqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ci9ZQeUP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29568d93e87so30799455ad.2
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297616; x=1762902416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EcnKw5Vg/t2I2OAIh++3uub4f2qFY8lrELJJkn3rfs=;
        b=Ci9ZQeUPbC2JIo+HWmjbMAVybvUhHIxXbAGacTb2V6uIab15okK3ia885HvsroXWNl
         L6ARL8V65grh67U3Bhg892/ZXduDA6aON0fpkk6dN25mMjzeIn3/E9MhYr6J9FS4vm4U
         /jop7RF7lvIMisge9jK8b8EXCOIaItBCls5Mjfv4VmjaS5cYffrEZKW4LqVMAp+XpMdR
         VYg/UBTt1FHscY1rlcKk1xRDOIKQFM2ibCK1XE3NJ1EL6x/roNQEVoCfhAd4o9EsGQfV
         sK1FTSU94sFXhhMLJMx5Wv+SwqwEPQESNJ5NBAXoQRaWliuB/Cpu6+XqpOEHC8865V2S
         1vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297616; x=1762902416;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EcnKw5Vg/t2I2OAIh++3uub4f2qFY8lrELJJkn3rfs=;
        b=AKstkbWt0sC7PI8aJk23hlV29eKyqDE+oR+mQCjxxoR85j6yBahAo2uFnWOzMgPN5q
         d0Yq+P98GdI0OONfJLrLVRqU/RZOwYXlle8TuLNUPVLvImr6R7X+LSuZ5CLnNFSDu2bZ
         UIR1Vb6doVzUmmAkbLEMd7h+mJfWUdMJMey/BE1qDJdgPAx0xeiNkDcUT24qSt0zlMnN
         +kJxQVfrmck8CcYH7MSqY+V5rYa0nSAkDsMvv8rdUBCB0jQcjM4YRrcSnLVlJVkoQgix
         mqQBc5yAM/yS81roJiQ75KmEqd2WzQneKBKGALlaDb0qZVQNOaaSU3e3WEpRqHXJhsrS
         vVww==
X-Gm-Message-State: AOJu0Yxj2oESAaNhL3MUNdm5X7belClKzRoZ8l72+7gpAH6r1T8QoPGV
	GDKcJ6oM/z01QpUa6cf3UdykXd1otA5cJu1WI6p7m6Pim2GRjVJNjXPNgH8YtWfkk28=
X-Gm-Gg: ASbGncu8QBgk83YuuwCBgusXOBHR/PWT2jK/A+X5ukWl+jESa6OX3AGsHUEdwQQ7vGD
	Qwd/oYjGUcEZz/T6NcGPBXUczZ1PBTpEO0AA1dtRsJH9K7lXUVGdlGud2KKnPZtjDogL/I+0Ipe
	cvsBEUrVh+qZI4tZqnYyjuQYKgtpZbNBYgLSUvtkkjdNnt/hdSMbBItpS7ev3h1yRUXXE3kzdsP
	6OUmMUpBDDTXZy/JuMQIWAGYq3rxgVjSnowsbWT48fO5Cigp3xTRWsfok6lXbGn+MK4OEoe+5Sn
	MSHBJzxRX9RDKsALtXNSy/1Qnrx2ATQwXtdfP1Kwigou7ISAVvoLijliTv0tl5af+aoWWeaG607
	pSZzshddzjSMih0a3VxqMVA9XaCQw+lxRMaBYu0i0nLj3wvSk5T0GP0goo69HP0M4LwlkVth5Hw
	==
X-Google-Smtp-Source: AGHT+IG5gxwmAYJciLRF6foqojxmxqv0joYPOGI/9pEEe2GUeFbVqcfpF00Ix3Pu0jghtr/eG0KwNg==
X-Received: by 2002:a17:903:1ac6:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-2962ae676e7mr13487805ad.51.1762297616375;
        Tue, 04 Nov 2025 15:06:56 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a696dfcesm678615a91.13.2025.11.04.15.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Ali Khan <abdulalikhan1337@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Jens Schleusener <Jens.Schleusener@fossies.org>
In-Reply-To: <20251007-omap-falg-fix-v1-1-545a1de74a0a@gmail.com>
References: <20251007-omap-falg-fix-v1-1-545a1de74a0a@gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: Fix falg->flag typo in omap_smc2()
Message-Id: <176229761544.2840692.11845969697062709600.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:55 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Tue, 07 Oct 2025 12:53:09 +0000, Ali Khan wrote:
> Fix a spelling error in the omap_smc2() function declaration
> and in a corresponding comment within the assembly source.
> This was reported via bugzilla in 2019.
> 
> 

Applied, thanks!

[1/1] ARM: OMAP2+: Fix falg->flag typo in omap_smc2()
      commit: ae18c465b3ae0879a023b4a89c032064afb78234

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


