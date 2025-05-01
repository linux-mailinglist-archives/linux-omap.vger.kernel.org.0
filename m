Return-Path: <linux-omap+bounces-3632-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2EAA62A6
	for <lists+linux-omap@lfdr.de>; Thu,  1 May 2025 20:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34729A2E8D
	for <lists+linux-omap@lfdr.de>; Thu,  1 May 2025 18:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC6F221292;
	Thu,  1 May 2025 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Z254Mk3u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ADC2DC799
	for <linux-omap@vger.kernel.org>; Thu,  1 May 2025 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123088; cv=none; b=jMTJ5i/5I1d6dLzbyfQPMnqyB92WlapOh4oojbE0rFsNJEDENTQk/4UPATQO03M5PgyjFq9z9OsYN4tiAbBZxBXmue0Sdo8j3q1aBCODI8gwEK3ebsj9M6iQ/f7S4Cf0RYcl9a1VSqcswBX3Yw8vtZluXBRaaGeIeR18RD+RHtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123088; c=relaxed/simple;
	bh=n2hdrzkozFdUt75+CFb0KwrxNnR9IhTGVsPXZ6VJ5AQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u2FzJ3pBad8nvQ+VOR+yAeN8NV0yUoX7ryNxPCPkRqlf+XK5yxCUvLGQJVWBQxDHERvjM70mWRF9xfSqooOpkuY5tKnGOLwp4/6EAUT6lVYi1h7BAV9F98k3C8NV1M6E1K126Rispf5MTFCgYYsmK3Vi8pkhhX+kTIJZ/QPHhVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Z254Mk3u; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22409077c06so21099015ad.1
        for <linux-omap@vger.kernel.org>; Thu, 01 May 2025 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746123086; x=1746727886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9t400dGVqKpa0aJ5NF/wqCMTUOEugJbXa0Ak07h82mM=;
        b=Z254Mk3u/zSGMbaP17a1gwGX7Qdl9VC6nX+mkYtasNPHNMV3pMncjHl7X7Y+f0q13t
         O9BsWhcyp1DP2DIjpZfxfU+rgVDW7vIWkhsS4moraAyu/L9AqFXOp1KrGqjYrEAHLH6I
         +O9SB+sO9AIDtpLJQmBXXRbz2SXjvNaB2tWMQD7KwTbLZgDHr4ROxtTGIuwknXnPsB29
         kK88O1MiOop6HUPYHT5Y68UvHTg4UCy5vO9W/rR9l+pofSY37zocqYsXv+LDcpgjEboL
         1GsZNr00hOjL3jLJHohjNuB0sdQGsASGd/LBFZa26ehY2Luy1vsurXdcqnHzqVZC0xGN
         wRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123086; x=1746727886;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9t400dGVqKpa0aJ5NF/wqCMTUOEugJbXa0Ak07h82mM=;
        b=FSjKSgWrirlt7wmW7VzDMvoBoeaG7ukON3yjyfl7cAEzRJQtohVxT7iuWAgPo5/QFR
         6uiLoWBpGL8MdVMXqu4+8PdqKzvc59dr0Lm/1a6Ud2FQtBpOIgy8oDnt4vGeofv5ZwVr
         +RxyBFew55png5mGnSIBkQEBltN8f0CaXzoFpU663udb2r0KwOk1KREpVnXarutBed71
         q65T0wgofRQeCCNDwkhkYwGys0/U0QzKQQggQh5Whs+hX66ADr2ohXKsB44pefqQSBXc
         Ah2/hDeoEyRAlE5cLAymLfGL67kSaQrzRp9792A3cbCyBtFz6myscdFKkgrE+v8C/gl7
         SgYA==
X-Forwarded-Encrypted: i=1; AJvYcCXasHtt6YuE7+Y81kmsAG9NUnlAqJGhyPMtKjFr/YchzvAtzBUerTR7MMKLBOv1wu8r0CRhzwXs5365@vger.kernel.org
X-Gm-Message-State: AOJu0YxDGNAoYSa/xsZAg9gFrjUjh/rSC+9MTdYB0fs4S3MRHH4qa/Di
	03AJefpI4K6NktPv2XTtiZCDsmUIwJssAyHW57RfvbSiZcdYb6SJ1MVhmnaSbGI=
X-Gm-Gg: ASbGncucdS7a2bOsHTRDrOmdeZX/ecOljAof16gMDrvKjKxBJZQfBkLux/4VHdNxyqC
	scgMgGeaOYBNJGYUUOtOWooy9zwnM7C1zWfdzxvdMmJgQJB+RDtOPzEKa1NKeKzeM12PTeeVhyY
	8FCc635vXOyEW9hkP+7QsVKFbTUYqYor++WNCjgfoykNkeoAJ9OFKSIVfbG+rM9a6woWOUS4pQz
	0Q7Y6uYBC2VodRZ4M4JE62WJ60Ml1f8pcgELCDZeTVJZJuo8W8cQzHvVlhwe2juvaVezO7cAO8R
	vAPZCXil/6qa1/ox9OAU6S7DaIEEeRC4eXdmFSI=
X-Google-Smtp-Source: AGHT+IHS7iGdpbnvZSPtibrutAPiNsrIFRXMmGkTFO74ZmAaMQXJuegvR8E/cjr6fvB47F0IN/BmvQ==
X-Received: by 2002:a17:903:1b2d:b0:223:f408:c3f7 with SMTP id d9443c01a7336-22e102cd9bbmr970795ad.16.1746123085925;
        Thu, 01 May 2025 11:11:25 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc6d528sm9783865ad.137.2025.05.01.11.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:11:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
 Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20250427052735.88133-1-andreas@kemnade.info>
References: <20250427052735.88133-1-andreas@kemnade.info>
Subject: Re: [PATCH v3 0/2] ARM: dts: omap4: panda: TiWilink improvements
Message-Id: <174612308508.158405.11020603792617275281.b4-ty@baylibre.com>
Date: Thu, 01 May 2025 11:11:25 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Sun, 27 Apr 2025 07:27:33 +0200, Andreas Kemnade wrote:
> Add proper definitions for 32k clock and enable bluetooth
> everywhere.
> 
> Changes:
> v3:
>   - better commit message to describe what the clocks are for
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: omap4: panda: fix resources needed for Wifi
      commit: 1132bb4df2375ae4a2303068c6f5fc62bc63b870
[2/2] ARM: dts: omap4: panda: cleanup bluetooth
      commit: a2db9bbcf64a43c8347625dca9ca0927bb444d43

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


