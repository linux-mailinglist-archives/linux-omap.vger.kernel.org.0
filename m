Return-Path: <linux-omap+bounces-4073-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68FBAFBE0B
	for <lists+linux-omap@lfdr.de>; Tue,  8 Jul 2025 00:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08162166A52
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jul 2025 22:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909B828D8CC;
	Mon,  7 Jul 2025 22:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rDVrAfrC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B5628A1E3
	for <linux-omap@vger.kernel.org>; Mon,  7 Jul 2025 22:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751925739; cv=none; b=WwSdyVDBYV32h89w18BD+/TDPPnn4Ci/X8JdoOmj+Q3bLQWfHdyHjmTWoacB75KPMIXdiG3SSRdWTAivPFfAnHxxQGfL9Z7vjtOE5cPbS3L5NoTgyPTqoTb24pdCr1MCuoMrtGRaWuCdZffC+D5SHfWB5ir3XK+YvDw1zogAjzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751925739; c=relaxed/simple;
	bh=M5CKuRv5NLhRjmqjKZwutyQJJfBH+MYMBM/Ul0kGuFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Desi5j+qD+uMGHXaQpXSHxuOiP71g9UhA+AuXNmOAHs9zs0ylEFYT5fn7pdLBSBTd98PP4U5JpJM+qOG0E0R7O2s7JbZysbYmYJIxlMsqtsi99af4tYunvA+yPbtl81N1f3lIgeHPaGKz39/vnCXKdlZOVxGQCmF9O3KFKdm76g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rDVrAfrC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23526264386so35492965ad.2
        for <linux-omap@vger.kernel.org>; Mon, 07 Jul 2025 15:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751925737; x=1752530537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMU0RXTncBQjVBF/K4IRgwydOyiiWJEg1TYIRfHWA68=;
        b=rDVrAfrCOyRYGsEZfy+QI0QWn51zHFTZcYb+/9qjX8eCoOuqsMSI6czsUjUJkRcM2g
         9Qnp3epWgrxYkddWTVb28DEqWj1+P2x2oB5bRGF+A+cSz4DIdTm8Ew0hDLwVrkr95NYj
         hAvzgAj2J/O1tGZTHzon8AnhWqVWamRQBgNclNPtYUMkrAQD3OUQh8WlUfb2B94HgsZJ
         JlnicNLhwDQFRTG418/EGOTBpYEvtZVaCHDpKTwSuoc2ypdy3pADhoTGOWSK5/fsu0SS
         bCeh5QuiWrxoGZRgXBmM5Cyj9LApq7yEGPH28Dqme81V005+AGzLaiELMseEwtzQ3SAu
         d+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751925737; x=1752530537;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMU0RXTncBQjVBF/K4IRgwydOyiiWJEg1TYIRfHWA68=;
        b=Vwcf8C4FlrUR8NOIoZcGohVsb8nd/80rbr0MF6osKePPwN56wOmJFmenG3N5bBkn16
         xOmM/qVUtVoUqSgbSQRc+4qj2QrqqD5gPQqTLW2cKFeSThLnQoPnH12Q1mThTO/4TjN2
         5/lWeP4BeygGXKI7S2wAbLl7LZix/hd4E1/J+0n7907KwPKi0UMaqRAQKFaHZa1IonrZ
         LkkiRcLtX5ynrc54uAlz/Q/B3sSAOIUjFZKf0inZnTPx2HOBDrxyrZ1T1nEpMuPjpoR4
         /b8G26Yg4kf4YLFdHnL/l8jBmTkrQRuApshcmTe2WmrkWU5c90Ap8lnOoM23Re6wlGP3
         mFLw==
X-Gm-Message-State: AOJu0YzAyFmXNgcQV2H3kHbIkdf9xdvAXGGFCm0OReONxUV33HZrPnUc
	j38MoWFz9QlV4HPWw7A38DXZDGintkBVEOgv/d40As0/ZIcHEOgXKArIwsehtnJrqIM=
X-Gm-Gg: ASbGnctIu8kIwTPGo2ukujKzn6FbFvvEtfYRvHT7Lb3aIE/h1TG9qsRK3uD+ZpAhrqh
	kfWWq5L16JS2PpzeU2htqrqjixCxQdLWBnpDdCx3viRHzlpNoCFnoAwZiwisBuG2zeM8ZH3XBDi
	PAj2bmbdDpseLLYwWyr+rs1JdnYL22r2Exzksiyth79Oc/zzboGraXhn4xsQnjborhw7POazX5A
	6cjDXLosj95F3+Jf2ubIXWPr+26/btgtNaT+1jYTYvj3NjaPas6yP7KHGbKhTsP9ikzvRE+ExaT
	QVls4m2rYFBURXm4NG/guytMqrSQz4/Vd4ODeq9oZXOu2ZcnL2SdEoTkg44n
X-Google-Smtp-Source: AGHT+IF3ndJoSXBRWTscm4ArK+g7LkuzRAE2xYB7+hLKI3vLBOrqbLkXRpnWS+dMztiRe4cFppAyPw==
X-Received: by 2002:a17:903:2b06:b0:234:db06:ac0 with SMTP id d9443c01a7336-23c875c0237mr213191825ad.45.1751925737144;
        Mon, 07 Jul 2025 15:02:17 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455ebb0sm92692555ad.120.2025.07.07.15.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:02:15 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Albin Tornqvist <albin.tornqvist@codiax.se>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250624114839.1465115-2-albin.tornqvist@codiax.se>
References: <20250624114839.1465115-1-albin.tornqvist@codiax.se>
 <20250624114839.1465115-2-albin.tornqvist@codiax.se>
Subject: Re: [PATCH] arm: dts: ti: omap: Fixup pinheader typo
Message-Id: <175192573551.520018.5675346389036429336.b4-ty@baylibre.com>
Date: Mon, 07 Jul 2025 15:02:15 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Tue, 24 Jun 2025 13:48:39 +0200, Albin Tornqvist wrote:
> This commit fixes a typo introduced in commit
> ee368a10d0df ("ARM: dts: am335x-boneblack.dts: unique gpio-line-names").
> gpio0_7 is located on the P9 header on the BBB.
> This was verified with a BeagleBone Black by toggling the pin and
> checking with a multimeter that it corresponds to pin 42 on the P9
> header.
> 
> [...]

Applied, thanks!

[1/1] arm: dts: ti: omap: Fixup pinheader typo
      commit: a3a4be32b69c99fc20a66e0de83b91f8c882bf4c

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


