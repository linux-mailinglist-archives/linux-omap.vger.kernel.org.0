Return-Path: <linux-omap+bounces-4860-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44235C38811
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 01:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12E694EAABA
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 00:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328961C3F0C;
	Thu,  6 Nov 2025 00:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zlTTeiu1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021191A9FBD
	for <linux-omap@vger.kernel.org>; Thu,  6 Nov 2025 00:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762389614; cv=none; b=k30iqEjy1C6n39AKi5RKfFDXgUQmKqbo2wWnfZYBLW/JP9+mAmvUpRbbFbbvWHhTMZA8FviHNGRVBguR8AdTr6e+7qKvcCGmUUwfAz4h5S9sX2iIgo4FcAIIU6byO+0mxebCFikGfmdzO2ZnlErb5oIrvdfa+rAGO7+uT4lMsA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762389614; c=relaxed/simple;
	bh=8qq2ZhbRV2og48zRUPnewAaBEr0HlLuurubKZsklLAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PxnlvFGFUzFzAbayozxCbZbegZdv6HWxI6mAY23j/CiE8Ua5DFKf0wEfMt8vMb5pllTafT/lCj9e6bnZ8UgJ7WTzIbGX870lsutYkQ/RF0X8kAMV6Mkxp1PfU5L+UFpsV9nkEEOMNOP+6agkYi+buNLfL++OleSi5/32NnLpWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zlTTeiu1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29599f08202so5184985ad.3
        for <linux-omap@vger.kernel.org>; Wed, 05 Nov 2025 16:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762389612; x=1762994412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkU2FfTGJiTCARoq1SWVEP1uooasHwQC6BBNqtcJeJc=;
        b=zlTTeiu1LQoSWLFwszQsSVn4KTF9VO2hCgrTCQ2kIhO+GZEhqQC1RkivUgA4cYxWYo
         gCKOknAqLf7cE23kCSjzYG2d0pBGBDve3cOEd7aYIuBRKRRi+BIe60Cpfq2i5sUtnhZ9
         QNlrG528s3XnRa6uXZFjJT7A8dRqs2hsMkIn6U/XXT4+s5ueprfwXSl656Tau/djgC+x
         +FO+JZKDFCZJAjsD6HItEzF8Ge5bYxlStbhrIJeF6TDD/liJKCxcfxZfThNOEHSn/OL3
         C00V1iSmSAiWZTW4bUHwVGEByebxOccdrN6QUbgyZdqN46bLT3yPyubIonWJ1x7hbNbd
         +w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762389612; x=1762994412;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkU2FfTGJiTCARoq1SWVEP1uooasHwQC6BBNqtcJeJc=;
        b=GhIgIZRR2y/4lYx+dSj/lmaZgfupctQ4GKeyVHRPr2AM/S1RL+KU2fxncuwGejLL48
         trAVN6q42loEQCEJK9TZ2hsk2/92kg6/8baf7L2BCohvxtGqAVVQKiC/l3Srx99VAYC2
         yxTGX1Uxz9meQiutOHuPzrqHVnYvqlLEEOKKfumBgpLB4kSKlY39Y81DjDw4gDWBGyRW
         0K5C0ncq+Vi1kuAQejPZYBMCXvZClO7kwv/GCsEhSoWcwzRHjZ+Ag88E7M1oHFD+azyV
         uDmmha/r/eVLztPRBP6USboVquHKTNT1P8jUGA7GCMTJTUEfOZtj1LR0lCL4p5lsBcBp
         7ZEA==
X-Forwarded-Encrypted: i=1; AJvYcCWzkjbxqmdbF/X43vAalz+h8qbcj5Ml3hhFL9XvyoiiMM4pMzUzR6KCpC55zLnfQyXMInZqb9Z44ibM@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSJU83r61TDfv6qyOAEssUFh6jc104sEOaitgD5RC+J5Ggl3y
	HtO7/TM+itCW3+HKscmnwC/CMflVBaYQt80+V0Bl3uOF3BObR+9Kjj5f7GGi/ZHA5Ts=
X-Gm-Gg: ASbGncthXqnABxb0tYR8HVAkIpxFdhbkCHkhQcOpFzg6Z5cQbDLIQE3z3ZBdLDGikKO
	ACCiqje2SP2depWblz/K6ygxw5b+BZfAIkwNWuFJCSbhwr5A4aufJ8aNnniJku6/ZWQOO0T1K07
	0dHF+Zk2i0iEywhIClZmaTg9a3EQeNrXI7RXR1/zWk1HjJ2Dy34otFL4sDCEcf6CYyi1FANHcvL
	gIgAgaV1tWKvGAnYZrrfd/nxMtMPnvykfIIA1ZOhXkYk7D+/uE0RCdTUxqO4fs4JHw45fekRMzV
	Rlcxwa9jfI5J3amLQWlv7FnCv3OWsCFDVvRo23quJlXUY0cDFGBR9cuP8G4Ndmat9pno4GgmENo
	MaARD0+6BumeLJthQyPfy01VVIb3mVzd0LKa6MMYIT9y5RnfHO2Ekkg8Rs54ZKEF4tP8Bt/RISA
	==
X-Google-Smtp-Source: AGHT+IElJ2Zmd/6qjx4CDLzUHtLcy82LmsapEHCX/tbNElSc+kGmtRslt0CXVghdlIDwLr/630JIWg==
X-Received: by 2002:a17:902:ce90:b0:296:4e0c:8031 with SMTP id d9443c01a7336-2964e0c8139mr23358505ad.17.1762389612288;
        Wed, 05 Nov 2025 16:40:12 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c7c5ccsm7482495ad.57.2025.11.05.16.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 16:40:11 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251105083422.1010825-1-alexander.stein@ew.tq-group.com>
References: <20251105083422.1010825-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ARM: dts: omap: am335x-tqma335x/mba335x: Fix MicIn
 routing
Message-Id: <176238961131.3045323.8626140069542181620.b4-ty@baylibre.com>
Date: Wed, 05 Nov 2025 16:40:11 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Wed, 05 Nov 2025 09:34:20 +0100, Alexander Stein wrote:
> 'Mic Jack' is connected to IN3_L and 'Mic Bias' is connected to 'Mic Jack'
> Adjust routing accordingly.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: am335x-tqma335x/mba335x: Fix MicIn routing
      commit: c1d5c2026969efa372b759aefb2f3e63eff29aa3

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


