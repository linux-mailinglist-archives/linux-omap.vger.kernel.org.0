Return-Path: <linux-omap+bounces-4843-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB82C3355A
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B8F2A4EF276
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123C933F365;
	Tue,  4 Nov 2025 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dgVOiRzL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B63358A5
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297619; cv=none; b=WdT3Y5sNWbHXsG+HAxY6yxkSRSKxnfmUxB+aGTNxn4F/F24pWyGdsfnePf1HlnL/bdVXBKr7Ez7y7AFwYg56PcIb3AASjvAudyecVKVjIfBDXuiZ5s+L8Tx7lS49bxmyrLGp3qXcN345bfXOnh9mWRo48s9AjdzOHypQ1uHe624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297619; c=relaxed/simple;
	bh=d26NPWY5B0QwqopCWCmqCngKo8m7gGixxk1s3JgrrVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gn26Hn67+8bEJiIUFxBu50yCJ4Kwouk9PIjktn2v2rEwfGDhGEte4HzDpxgH92bXlDDgBAGP5hpaAZMsTswbiZkqSRCyf2jtgkiL+OQK6AfiFudymgtXj7NN3RJQf7vkjwlzFRSUbMlPpMn/8eP0R3iyEJxtj/SAVWTcq+jDFwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dgVOiRzL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a9e8a15502so2808306b3a.1
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297617; x=1762902417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBUGFvGes6ovSwe2/jP44ZHjL/4hLJHicIf8lTH0o+U=;
        b=dgVOiRzL6kyXOnweIfY10BUCDIDJuXO7QserHLyRXLE95CerlXIUOVjRwtiQeJU2b/
         +kshk+hwcEdNpEEoud//0LLPNda7JMxZhvJlfXdKx559gMfxg2skOV725hlM4O/mx4yj
         LVtjO7d44cwVj0lDgfi7ThbJ05vVfUqJdpqWR6s+Q7Zn1socsh2RQpBg1scDCS2WKG3X
         mY5UaNWsYnKgePcOUQ04EZJaIZivFBCnfYcXUcbNap983OC6JUEjzXIcdHttF7FUjgdW
         tN9iPLRnYnzotFlR77vpbrwr5t5dvdDQo/V3oR06sVx1mq3VPU84sgocFEv0MNw6uTpk
         M8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297617; x=1762902417;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBUGFvGes6ovSwe2/jP44ZHjL/4hLJHicIf8lTH0o+U=;
        b=Y/C/Wwb0W551rtWL+cYc5n4rJc8TgYc/OdZrXPkRxaXrv5PRJT2Mq2gLbtOjSZlx5W
         D5WN3kOsuBTH0p7zBBPLSzOoZrADS8W4JWvxwwxLWc1unDxyJ2qAY6S5iJGRPlQVlcQq
         ffr5VoFhx+GLc2hmYhxKTcm7V1u+HyIXf8jGzvqQC1vZR5Md90M/EUHtgfUyW7yYEAYI
         63JY3rrMoBm8y5U2gDEVkbdmHG/HK7hTgxiOcS/UUDB3rPCvuDE4UqqXSmseGRu8Ya49
         +PuxESJIvUOQUy/8Mui0wpqMwsy1LWX0ZoO2SuJfGjCMEuTx01hk1DjC2G5Sag9YCf84
         iYNg==
X-Forwarded-Encrypted: i=1; AJvYcCVrRnNQIasXgFI2Eik5lDRQ5YWF7sxFn1UpWW6fdAnPv4F7tYaF7C1CanN7yX4ql9X7em5iHox/D148@vger.kernel.org
X-Gm-Message-State: AOJu0YyzB2B7i3GYImswnqY2fr6SnVcm6BZQk322X2KWnpRF4YCqChcV
	k2PZM/ba0JfA+dvGgbyTf/0yTEemXXm86wdbdX2jLb33d2iuFwdbQRAdN1TtkT34fKw=
X-Gm-Gg: ASbGnctwtE8H+YrXc1OXHpSia2ktW17WFrn8//BMIJxs36XES6RrFJPX+75aHb1jnR+
	HkfPFx5FzhSFkdpCiaedm2Swodbnh832pybz/XEqldHfhiECzQy9YFrFYH8Kg9TnEkb+229rOjU
	ZS531av7rlEo0TE3O6EXrmGxbNIj3S0Vsttjanucbd+PPPftifhpuoBaeNK2oKOblaDtYt2RSii
	FvMazBt5avU+y+ed9yl3tiB/GfXmysagNJdaH2fR5MzNTygCnLb2zjE1RnWO4z+z9jW7gUcXio3
	U+CKOYCBgY/zQ9lLvuawKaFQVkYEVGIWDkMNOuK+YqBfkBkHQDteobBlHAXpOKwCuLihH4+C02j
	wIcJO+88s9UARWG7UcUMys95kt4UH8AIIqZ9YfxpWnlACQvMEf0m8vgnXksjHIRjxGjq6ooQhq3
	xysUmyR441
X-Google-Smtp-Source: AGHT+IEZzCr5yLCkNIU2A9c7a3a/8wKK5qvY9hQpk1frk3eObQX/JcBmBL7BTk5If13X/8QPHLJfMA==
X-Received: by 2002:a05:6a00:1496:b0:781:9ae1:1be6 with SMTP id d2e1a72fcca58-7ae1cb6472cmr1244855b3a.6.1762297617416;
        Tue, 04 Nov 2025 15:06:57 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3824e5bsm4143988b3a.17.2025.11.04.15.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250825131114.2206804-1-alexander.stein@ew.tq-group.com>
References: <20250825131114.2206804-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ti-sysc: allow OMAP2 and OMAP4 timers to be
 reserved on AM33xx
Message-Id: <176229761651.2840692.2154178445405105304.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:56 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Mon, 25 Aug 2025 15:11:13 +0200, Alexander Stein wrote:
> am33xx.dtsi has the same clock setup as am35xx.dtsi, setting
> ti,no-reset-on-init and ti,no-idle on timer1_target and timer2_target,
> so AM33 needs the same workaround as AM35 to avoid ti-sysc probe
> failing on certain target modules.
> 
> 

Applied, thanks!

[1/1] ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx
      commit: 3f61783920504b2cf99330b372d82914bb004d8e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


