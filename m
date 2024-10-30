Return-Path: <linux-omap+bounces-2510-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B709B584C
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 01:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0C4C1F23B87
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 00:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E21440C;
	Wed, 30 Oct 2024 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zDypYLKv"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB23A41
	for <linux-omap@vger.kernel.org>; Wed, 30 Oct 2024 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730247021; cv=none; b=j4dqHPh3xnK5R2P8oyq3lwAaSxmGo9AtQ2HZeAvdDUN1IknI4+wY3Q2m8/on2hI9Y8CP3upHHUUFUAEyk17KukMhZ+A51Tk/rWTlZCWHmxhTa0sG86e4BosGhlShCn579U/eGHSmwptdx9s1nvCPV8ARfkn+hrGd1wxVHMtv3s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730247021; c=relaxed/simple;
	bh=Um1BBdzOLBgVZV7AowBomIclS2RaECeu9YVyftjDJds=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MHBjAktSnPN6VoSpRmR+uUrbZT7lWml27XC2p0HhibFZW3S13sD8YacwSAc5cpj4x4vNTTUhNVEqzpyYrTGwLEH51ZES3gq7HsKDQ0kO14Kk8OlQxUnqrZbT5WGCBcS4hd2PayMeqP3TpHii4ND6v+rh2DIlkFzAAmYeLeZPTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zDypYLKv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71ec12160f6so4373190b3a.3
        for <linux-omap@vger.kernel.org>; Tue, 29 Oct 2024 17:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730247018; x=1730851818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yx2ZtyUjWj7/jT4VUlObZ/DUJ3gJnbsgf2IN8Ct+yA8=;
        b=zDypYLKv0Lw8h4o4n+tUvBG+M+AVoI9Xn07hegrTI4zKvYmqKEcbqX12uJamzrcVjk
         iVWDkZk+ivk+oLSKz+d9RYZa+FsZzVbe6N5mwO80lXaWc7Z1GNuqmK1qXhVnv5/XZePa
         TDbDjGb632Ep9wb1cv+T68E879wzDSYhNv/aWpOD1Jm37YFgxMTIBHcQlLHE6E+SRHlN
         4kXRX8tRau1+WJOpsPFXf6Jc2wWGZ2+I1ziU4mtYKOvcs0MZKr7TmB6j1MzpAIUe6KHn
         4MY2UvuHFkz1Yc0sPKxFiKEnka7Qyx50z4M04IqYvlggfyMT98xIfHupUnWrxxzHdrx0
         cYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730247018; x=1730851818;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yx2ZtyUjWj7/jT4VUlObZ/DUJ3gJnbsgf2IN8Ct+yA8=;
        b=DpatXOKUVXhPP2MWXg2okUKrT9VPFfKc9aLbjxlFHephgAn8jmhC9m434J05xnyZNp
         9QLxC56eu0pKwZa7pKnuo8K51+BZBKlKnD9MxZf7VuQ+6EYCZIkQdquki1ENqQgY1n9D
         32mPEFvPLCnAyJVO0Emp/h00AuIIUXCID+aVxBSdzAA6R/C2NPpZD4Z7Q4Iq3teGXLYV
         0nfs/XRL6rb5Yy7e4A7l+3vcU9LQIoHMG6B4l8bLbgT07lq5ds2X0fuU54Vi1uBrJnFi
         Q51CTmuWi6wBezegrhpHZyCRzxJM3+aNJXZjqCewTsGA+KPJYewLxBMu1jH6YGp9tCyS
         XHnA==
X-Forwarded-Encrypted: i=1; AJvYcCVcpn0S2HpMKxStitXeJRWP5zasip2LrC4349Pyt+sx3ztkGPpXk4rkBQUrcllDGSPUAq24CM3bnBI0@vger.kernel.org
X-Gm-Message-State: AOJu0YzFG6n0vUmzmSmTYYYNEHGAzKfD5OQUVbdy0wkkJCvy+68pEwWC
	WQKKghM/vObDsQ3mYptNVgtDEafQNnVCduilBs+e9hAXHPd9fH9Rc8bpwxFx7n0=
X-Google-Smtp-Source: AGHT+IHUR50UflND4vAKgFx9zaRoDHs1Th9JVXI+GeYW6r8aL6K4pUKlg3OJSUCPF0WTXr9SGTSHqQ==
X-Received: by 2002:a05:6a00:3d0d:b0:71d:ee1b:c851 with SMTP id d2e1a72fcca58-72062f13bd9mr21012618b3a.7.1730247018424;
        Tue, 29 Oct 2024 17:10:18 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8176627b3a.33.2024.10.29.17.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 17:10:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, 
 Roger Quadros <rogerq@kernel.org>, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20241018214842.275194-1-andreas@kemnade.info>
References: <20241018214842.275194-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: ti/omap: omap3-gta04a5: add Bluetooth
Message-Id: <173024701720.1375433.423261408152684119.b4-ty@baylibre.com>
Date: Tue, 29 Oct 2024 17:10:17 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Fri, 18 Oct 2024 23:48:42 +0200, Andreas Kemnade wrote:
> The GTA04A5 model has a wl1837 WLAN/Bluetooth combo chip, add
> it.
> 
> 

Applied, thanks!

[1/1] ARM: ti/omap: omap3-gta04a5: add Bluetooth
      commit: d61ceb5a520162e1f321369a6aeeea28eecab6c4

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


