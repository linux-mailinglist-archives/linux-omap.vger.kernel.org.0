Return-Path: <linux-omap+bounces-4846-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA36C33559
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791B618C4F67
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888DE346FC8;
	Tue,  4 Nov 2025 23:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A3kDzrrK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B566346A08
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297623; cv=none; b=ASCIp2lNN7ei366Upwsruzn9wut82SSs8VCbRF3/7MCgu2AcTRJNofdCf2EzArZ+KvAGxAWOsOpC1+yTuH325u+BgHCbdax5Hf6NVkdirrrWE2o2jiEWn+CZM6qMMNDtcWYG0yh/v3Pqb91A0hRSKtj761eWFf4upJeGn4Fk3/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297623; c=relaxed/simple;
	bh=+x1u7DsqDUclh/owaM/bK5voNKKcZglEj793Gh4GzMk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=skkUv9Jt4qW7Zat3s8h20XHLdfFH2aC9IZb5YpTgKDbSZtZ8dRxJQFIKrnhqV/pV6hEsy8Wju3cI2/l/pxEAgDG9U2J01fhGIYi6Gw1ARWjW7SEjBX1nmPZmQnJeqozHI0T2F0/C7XIwsy/SwY1dyWlE2YJH/VW80OPSVsltgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=A3kDzrrK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-294fd2ca6acso2561135ad.0
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297620; x=1762902420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHSamikVjrVol75rYdX/wA0TP+ZRoamzeKbRQET/Fto=;
        b=A3kDzrrKBAd+igP6DAPMYXIO0hAdOuNSFRt/eDGOCPHUgjCH2RT/NilhkgkpbwxXQ5
         ezRcvUrnfusG3H50Z1cPY/I0G+14CfiBz3TUj8UT99U+31NMl8MnSkYcEcEDyIrvZX3E
         qLMa2ge+jlffq4XaxDakgvMRxvlic91sDv7v9G/YbGULu78Fm5gk2rPOrCb/Zq1f/+4G
         S862r92ZIvWjO5MzpPpGawVlgjwctl2TcY6B47MFvumu446C0TG3J48eYggn7ZN4I8DK
         lnBpETodbBfNM2KfHTlKPJ5iTRlTFcdr9Nx6LU2cEeCyb2keVqrdWgvMOVIy+6WZsSga
         tOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297620; x=1762902420;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHSamikVjrVol75rYdX/wA0TP+ZRoamzeKbRQET/Fto=;
        b=WJUtiu7xtH3zIBiBi+ayC1crS10L8nvNhveUq4CjRvYh9zn1LK9bzwIVTEZj4pJQ1Z
         M8PSItpxUaYO/TodBFsMKEArwjP53aBuU5806pxSlbo5WAp+8qQYtFFhQtP6zweyqh1P
         5Tw/4EXw/H9FwKzxCw9Fs0P/0qGUq0UKX4YQ9u1jZxR3TDytgAi8GsHRrNAtm7hs3jo5
         Mwydn7zphV2B98+vZyosexA9Rc0crynMR9XzzEWszqpHixlSz41nWOpltjsPLEZJRE7b
         v4yp/l0iIGudLXCmoIirgh6CKFJtgkt35SpG/HYVw5NB1cdhDd/ThC9CM1iwcM+fuuea
         6eMA==
X-Forwarded-Encrypted: i=1; AJvYcCXuu7rNJIqtMOJQndwnyH16eTWDCuXzOH3RFE5IOZFQh5pek/6OKT4fen6Gu+lDvo3P3KTHDR5VxPoT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyga7Sly2MK/WvsZ5DFLjxAoOwUDvJMFyRRyur/wzqIjvrhqHIt
	Fspmg2L3O/3HQSWq0JohM/vmJiaqTAMjdO3VNAlOOvRK63LfBrU7puw+o8xsDLHq0II=
X-Gm-Gg: ASbGncsAnA5mksMHHVMor2fzLoFX2juA89YOMr5x+KUEFsN9JJI6i6XmNxN5ojfR+Pg
	MdqP/YlywCmUxL0nFRxK0Ggtic8sJ45KL4Mzcv+XxZ5yvF+5r4KyoSkF4j5rXG9p6FKpGNhQyWC
	DZQM/32Z4S1POcpDVhniacIPoxGIiAq7+44qzEGscQ/6ROFOd8N0FIlSZ5RD/GKdAWKQCg3AHzk
	qwqP1VzrtyBOM1kDMz9D/MloAgb/12MeWaUeex2X+VeiJZqTdMaiYzZgoEbgCZZj2afHpSzk9Lx
	f52SYOe7WZbJy53EyBkKPexggKLX7l2aRFOpOQXj+XHcNouvIqER+LmtyHBrWW4vf1OMvAft8iz
	FnS9CH4ICSl3EYCIjTLv9lVGflWNzX9keAZtpUwPOQUJZ45nVmUXu2BZcpjCfvYjEMBXa4xqwzA
	==
X-Google-Smtp-Source: AGHT+IFwaQTBRp6clVlgeUdPBLrNZliJRL42mTKXc1D1BNOKkI6h97kjY4cM1NfLKF6HAWHzWlKceA==
X-Received: by 2002:a05:6a20:9185:b0:342:c634:e272 with SMTP id adf61e73a8af0-34f729aa687mr1756746637.28.1762297620628;
        Tue, 04 Nov 2025 15:07:00 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd624030esm4104328b3a.53.2025.11.04.15.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:07:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 linux@armlinux.org.uk, tytso@mit.edu, lukas.bulwahn@redhat.com, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20251013120753.101582-1-andreas@kemnade.info>
References: <20251013120753.101582-1-andreas@kemnade.info>
Subject: Re: [PATCH] arm: omap2plus_defconfig: enable ext4 directly
Message-Id: <176229761977.2840692.1048568589731485574.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:59 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Mon, 13 Oct 2025 14:07:53 +0200, Andreas Kemnade wrote:
> In former times, ext4 was enabled implicitely by enabling ext3 but with
> the ext3 fs gone, it does not get enabled, which lets devices fail to
> mount root on non-initrd based boots with an ext4 root.
> 
> 

Applied, thanks!

[1/1] arm: omap2plus_defconfig: enable ext4 directly
      commit: 810c5ef6efe9a2be3203a50de781d9050e8b9920

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


