Return-Path: <linux-omap+bounces-2317-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFFB991188
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 23:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17BD2283CA0
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 21:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC491AE018;
	Fri,  4 Oct 2024 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="r2Zt/cjE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8821411DE
	for <linux-omap@vger.kernel.org>; Fri,  4 Oct 2024 21:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728078058; cv=none; b=mMNph/UAmGhh1tJStRxpll2fVrzqr3b+U9L8Kag9KYqBVaOCHsBrBcfarX0iq24wMez+GnEKx5gOGPVrWPadjWzbCfuAIbL0VPU62ktVWwkoL5nEKGkxAO/IaR5VOt6jLVUEPAXJkcP+ps9LL5ZDd57hUjqJDJ6l+fZ7LuB7ukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728078058; c=relaxed/simple;
	bh=UoYyHSaGN4evXNG/TbmwzxroeUm+2Gmv++PjScBOvoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t6Xqv32WYXU7+qnWTvUDZGuTEbyU3PWSsYEW0E9/kdt48izy5lBYwmZiluTE5Tfz0XoVf738vhwbl1WZC8JFKWoV/ObaL6EOLnarD9WG6Bm1sQ0ES/ZrmgGOTrPiMP/TSJGG/qQdNJ6ksadKhuXrsCd1r6XGQ/9HVrvhdOrtFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=r2Zt/cjE; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71957eb256bso2333548b3a.3
        for <linux-omap@vger.kernel.org>; Fri, 04 Oct 2024 14:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728078056; x=1728682856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tXUbWLYJR3U+zEjSbqk0pk+6bVLw22kfGamouLUdmc=;
        b=r2Zt/cjE3xn30hPQCxPePWk2SdFuQyE8ptxtmGs/Hkfj3+ONDHbFHz6FEpZPysk8o4
         T4+No5jlW28IwB+HbP5kq8KgADrnubILnFA4RamQpGGTCYFeO7IKNhvMXgAd8Vrd5KJV
         86yfKodNCASQa3MHrRmks7J/K4BR+/o+M2IxuTt3wyy+N7HTpgFLwf0Uyjsu4US/k3kJ
         2IjRdGfFqjkzZL2aq6SNFcoQ0HcTBEztqFiSxVpyVoyJcmiafQie2//A+2tnOmpSB9jS
         wSngk5OmxozMGUDYQ4EY2XyGE+EuTvY9BOxxwjlJWvv4ZXxPHcB50hTNhit57IUaxnfR
         W5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728078056; x=1728682856;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tXUbWLYJR3U+zEjSbqk0pk+6bVLw22kfGamouLUdmc=;
        b=PqlLCXb4oIdY/olDPu8RUQcVNtL0qeNCX9zNmKVboiXmG+uqNiXO5Chf5MLP+XoykV
         MT90FdaYjxtZrjFx3pC0MXUKErq0VEdWM4ub3OvROrJ6VDBq0tTbdGohwenZLIxVhkDi
         EOGOA89ckyxtkcgVMulqOJYzj1Th6Af9lRrWfGQnVjpCuoVSl3lFFFyGiiiHOWvu2qPl
         Caj20GpHKzp6voukcs1Rgtnd1wgq2Q7WioYDhnpIMw7yz8KoDWnkG0lzpv6W17bHJ1m3
         9DJ5wAuMvQDNMq4MIGqkw+AdG0aitQQG8mZyb4sUrGsdURY6ikwIiH/z7Ra/TqDsRFwQ
         2shw==
X-Forwarded-Encrypted: i=1; AJvYcCVeAggu4tCMg9S9wRsNddFu3c5rgA611VcJWS4OZxstNciwG7NhxGm8ZSaof46fWj3OT9dQwcCluIAu@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1KJFUHxrrQwWcE6Ax/QJNqvlRHYZ5RWYVUFLrBN/CLZNIa9X
	HECxR9CrUvyeFp2V1zRD2BRpMcoR/hDwXcJFdUULbV3YFWvfeCykJBQ3SFVcEwY=
X-Google-Smtp-Source: AGHT+IGaTO9NlECH4L11tO3rmXARCrwfZWwkyx8BS6wAVI9KvFTpdxilVZxd5eG3rkBDAnNyLMXExg==
X-Received: by 2002:a05:6a00:1a8c:b0:717:8568:8cee with SMTP id d2e1a72fcca58-71de23d01a4mr6922378b3a.12.1728078056364;
        Fri, 04 Oct 2024 14:40:56 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7b9d6sm330093b3a.187.2024.10.04.14.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:40:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Cc: Paul Kocialkowski <contact@paulk.fr>
In-Reply-To: <20240915193527.1071792-1-andreas@kemnade.info>
References: <20240915193527.1071792-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: dts: omap4-kc1: fix twl6030 power node
Message-Id: <172807805572.806523.7110616698781538712.b4-ty@baylibre.com>
Date: Fri, 04 Oct 2024 14:40:55 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Sun, 15 Sep 2024 21:35:27 +0200, Andreas Kemnade wrote:
> dtbs_check was moaning about twl6030-power, use the standard property
> instead.
> Apparently that twl6030 power snippet slipped in without the
> corresponding driver. Now it is handled by the standard property.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap4-kc1: fix twl6030 power node
      commit: 59caaade193003e4dcbc92c82e66906ab7558951

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


