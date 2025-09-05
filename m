Return-Path: <linux-omap+bounces-4592-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBCB466A3
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 00:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 016FE1CC1E29
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 22:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163342877C5;
	Fri,  5 Sep 2025 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wwU+PRLJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0279288C36
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 22:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110941; cv=none; b=iGk0FVw3Zupi1+i3J8iIQUS+//juaxErm6NTAmBHkRoLoU5uecqTYOLjYU5oT6yPjtVPPqHVq00xRXMgxPbJOgaB2cIkY2v8p1ZfOAHVQPK4UDyIvnXIA5ySSfQwTd9Fg7mCnYOw+2errCB+kJbrAMt7qg4yHOuB2cllKPX6088=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110941; c=relaxed/simple;
	bh=659ccuPtSirr1zl00uU5A9iv2ysWSzQ97IzY0N3/LQ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MXDu3LoGRJkU3kcFACsaDfgclMjuKEHkuJ9cvQJWIZc1EGOJLkw9Md6JXZXmwcnIvARFuy3z3LaWqpegh955h1aqEBTehe3UE4Fkuh2WrPKtDuKzeXp4rSP9ZYHbppehfHXk1gTNqy1zca3Ka0pz6e2VRsadjDUrmE6ynMihoZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wwU+PRLJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2445824dc27so26497205ad.3
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110939; x=1757715739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg9V7A+vveZVwEgb6/4ZFeGTdbh9RAwHCgZXiFP+1HU=;
        b=wwU+PRLJ6cY93mx72ruoWa+plZJfmNDw0FkrC9Uc3/03PufF8FtvLY2XeuhSB7NAt3
         I2tWnWFVUPRcsxUq/PVK2UBRHRpuxjxQyfP/UQEpvy/8DSzilbQKtsbA218l09M6/w6l
         6qhW1vvgFCKC3HKhvs3ye5JaAGeNAsKf/eqvtGjE3dlZGY7TMCIx5CyIzHjSalI6yVzJ
         RG2Vvz6Md/bIq1Vl5O+F3Ai5sbhMUYLfrLGsW6ZRsw5Gh/UVFGasPqglA3KzMN8zBEc1
         eVVza+kQYfInl845IV6eOevZ0hHa3NljwUy7zE2XGTwKI/h/z9ggMrAylUEx6PjsUTcw
         HyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110939; x=1757715739;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sg9V7A+vveZVwEgb6/4ZFeGTdbh9RAwHCgZXiFP+1HU=;
        b=Q9MCv1OCCLSJfgXUl8X3MGVt5P/mrw62CuM8KQ9fACKR3e79hAnJCVdO7Bf7PeUjrG
         cz2mSJGe5pqpbtzstDGDwAImrnkGFPwXB9aSZCmhGMMZj4xB2bxNU4ZNJfz2XRBNsi8G
         87UcHWn7T26lceuYwxGS0kmhW1cl/CguYdii5/KDWeXrcm1RLC6wONNdOVGcz8rfvGlx
         WXCMofAIaXhyJNFI/XzRSjqkDH6bF6Q5YYWoxl7S4Id0eJaOH6wnuoErXEzIdfj7DHfb
         lobq3PcOBux7rqeCfqvZVCOYeM2sN6E2C8R9HFHJZMyjTeStOXEwFVGn3j/MYCGpiCEE
         opLw==
X-Forwarded-Encrypted: i=1; AJvYcCV0f2lWvJyXC+TvpPHNAcrl72GcDN7C0wx5bomURUFjbaaG8T2UdfuDY2DablcwJttno8BTNQPbOY/9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxb2JeVrbTBSEJ25GrimbTq3CYjpFlk0TrcB5fPCdAehrJuZs0
	QojVs/0HO1jWCWRMuT+qjbtIwosX8XfP9vClrrwLqHTeyHvnhG3ehZeKllXvuYO6xew=
X-Gm-Gg: ASbGncs8cqPj8xrd48LfgnG+tdU+FOX3MMYXiwVZSLXK+4F2YLd/8w2I0t1CBRGCRT7
	jRkfuzQPm70Ufk5sJ/mbsVCGc7ZUac90Zjk5EkJtLP2okICjYk0qb/cKTE2SPsYH3oSVmV231p7
	Wb9WbFt0x+ZzmRsZKB3vna3xE4BRpJN2eWEvLnm3zbZoBnngFKmfonSbdQW2X6uxSYdJ8gVY96L
	vsD6s0G8/YMM9hwJzaNl4xVXj3VBSMNP8/7w8iMAl/9IMBdNkoGyOIc0ar2xr+dbuGBiU/3WdHP
	ZnEGAizMAwPEwMfRjAD6MQw19MMOECH/G5jQZ5IZ1cQ/zqeufYcdji8787Vy+gFwPZ4OsZWROPR
	4m2GPTqIw8KjuWQMj+a245BXnnqkGmq8=
X-Google-Smtp-Source: AGHT+IEgDKOlBK6x0QOw3W3CHGpa5Cc8uz1T8qU/XEUIc8y0zuEtK7ONrjwU8Ktw48bTs0lLqjmlXw==
X-Received: by 2002:a17:903:3bc7:b0:24e:e5c9:ed02 with SMTP id d9443c01a7336-25174470d47mr3109805ad.54.1757110939089;
        Fri, 05 Sep 2025 15:22:19 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm13579564a91.21.2025.09.05.15.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miaoqian Lin <linmq006@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20250902075943.2408832-1-linmq006@gmail.com>
References: <20250902075943.2408832-1-linmq006@gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: pm33xx-core: ix device node reference
 leaks in amx3_idle_init
Message-Id: <175711093813.666031.2668373270360080348.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:18 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Tue, 02 Sep 2025 15:59:43 +0800, Miaoqian Lin wrote:
> Add missing of_node_put() calls to release
> device node references obtained via of_parse_phandle().
> 
> 

Applied, thanks!

[1/1] ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init
      commit: 74139a64e8cedb6d971c78d5d17384efeced1725

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


