Return-Path: <linux-omap+bounces-3953-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E226AE63DC
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 13:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9E311730F3
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 11:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2D828DB78;
	Tue, 24 Jun 2025 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codiax-se.20230601.gappssmtp.com header.i=@codiax-se.20230601.gappssmtp.com header.b="ckVOXXo7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66C528DEF0
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765746; cv=none; b=TrfoCBSNgVKQyKFUut4vEe+1B48u1qGZ9yP46MIbfeVfy/NscsGhrtSkBf+mUidWo4LiqzEKXeos0JQ2C7EqhZi9wbJy/+3FBSRQLsyB39NEvTqEFj/SlOfhbDx6OApg8Fp5ddv1j35LFdsHchAiIgE9+SegJjgbQb7HubomW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765746; c=relaxed/simple;
	bh=UxTC9xRj/zj8ryzAX8TqE4eUO7zS1dCWnLFe+Zg1R4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AeKFx/jz5yULDwxvMCkLvkINAlFZYqA+BUvh5oZr5JpHjAq6FaCydp4xE/nGVepTfxz2lGmnaqcey8cRxDhqGqE6SoX0diN0hVhZC9JKi1h2njlmEWHBeLLAVYBRBcr/0q9OGJ9J9AC4TcCtl3FHUjJR5RX1YCixowbPKyV5ZSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codiax.se; spf=pass smtp.mailfrom=codiax.se; dkim=pass (2048-bit key) header.d=codiax-se.20230601.gappssmtp.com header.i=@codiax-se.20230601.gappssmtp.com header.b=ckVOXXo7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codiax.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codiax.se
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-551efd86048so322800e87.3
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 04:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codiax-se.20230601.gappssmtp.com; s=20230601; t=1750765742; x=1751370542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDe4d6DAb1FPdDH1nEMDmv6KDrUedHX2gEqJkiLhXb8=;
        b=ckVOXXo7T62cvZjAdf7HtZTh3MwLJVlRzVWw81NMJaoZQvc6AiFjggK+q7UcWOfryc
         UI82g5i0OwSBdRM0jNaF64UhWfPdMsCKKbCf5OedxpzfAUdq5UHGyjm7CnPq7uDiNjaI
         XSwOsdfOFIdky/c7Eu0sEZA8ScNGaiLPR5/0PDzOS4hBdFJVkdsHEvPnluLJz7JLu4Fi
         7XrfpUz+pOzqez2kAm5otbQVKrKAYUioT9FWTQ2OEmjzc4ZjCeMhHmh6R5CDy6ESPdUW
         CWulya1J0wYB8sd9h3zuIcNDNDcbQxJrjnH4TJyUpEnHIOx0kdKh99HOW8ssF5VzjwkG
         gWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765742; x=1751370542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDe4d6DAb1FPdDH1nEMDmv6KDrUedHX2gEqJkiLhXb8=;
        b=OtLVqk6P+ka8nmS+MPG+BZa10uikrDjCtdqVkgoue50cD3GxmyjXLsBZJFmiI4Q+gI
         Xl0uyzC2LmcNrHrwdYrCDHN/A/RFkyYsa1ChKyw95e/oFrnarw/FqGDZ1Fj1o1oGF5v6
         fUtZdRnAO3UdI7Nl2WsoMpdHSC0D8aOv/6xHFOEcrSeka2mGT64oBdvFoOewY563HdPu
         h5Ebl4mFrXzTEzaA5L+rCUmf3YptT7x8OWmtC/x72VZole7sh9iR7QiSc6KzQAT75lkF
         0OZLGApf7mfa2xTXpG9J5mBC2eSqv5PQe9Tr/afG5s2y3MoNicn/C4x9lpVVEk7SMj9V
         vbnA==
X-Gm-Message-State: AOJu0Yz2Ij2VUVjLPOX/YicTsGLFo+DO8rAFg7NAXrzj6xUMYk5/gYk5
	RpDWqs8PyVvybnqU4VB2WrUiL6TOHPNEM1ToomUXJMDksNBPVGFj3qmSR9LIRnDB5v0=
X-Gm-Gg: ASbGncsw6OIpeFFGytXGMJoExDOEldOpD9P7pAtAe41N3vZDi2ai4DqPKpiF7b2xoIO
	4zFxHOttsx9fvs3doz/YlzLcAklfj3f4VMGHxiK50eCAZOmrU3DXjON4Vs8vJErq3nat9m7E3nn
	+YHnqJG8IVweGWQoySP5oRyQFejON5jMjIf9CyUXdTqJ2o0ioeGTyB2a+ysiCHQexQ9MZkLnl4a
	iGfB/H1LO6WYIb77FnlkxMWQ0PGUVKIlQ8EfHjeLOfBK50mIrjqgaIk6MDIHf0UXrPArW4KU3i8
	cHUTajn4nPnyDo53gH8aMsl567WJaViZDuAtknhaGtAwpQBdQFIcfzZJLg83brJ+kTpUPTuqoaf
	GnECeSkFs/mcXt2MoIiWwfk9aJyLo0kgG
X-Google-Smtp-Source: AGHT+IEfSt7tNNrH2iQBY0OqVXLuy72EhSV4+ycj/JlWBqXpOEeYEFU9T6O3BE1zu7c7pWadRz2Lug==
X-Received: by 2002:a05:6512:12c8:b0:553:2e37:6945 with SMTP id 2adb3069b0e04-553e3cfda88mr5286333e87.32.1750765741784;
        Tue, 24 Jun 2025 04:49:01 -0700 (PDT)
Received: from falcon.codiax (h-37-123-161-8.A137.corp.bahnhof.se. [37.123.161.8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2e5csm1806724e87.155.2025.06.24.04.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:49:01 -0700 (PDT)
From: Albin Tornqvist <albin.tornqvist@codiax.se>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	albin.tornqvist@codiax.se
Subject: [PATCH] Fixup BBB dts typo
Date: Tue, 24 Jun 2025 13:48:38 +0200
Message-ID: <20250624114839.1465115-1-albin.tornqvist@codiax.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,
while trying to set up the Beagleboard Relay Cape for the Beaglebone
Black i found a typo in the dts for one of the pins. I spent some time
pulling my hair, hoping this patch will save some time for other devs.

This is my first contribution, I hope this is the appropriate mailing
list and that i got formatting correct.

The testing procedure is described in the commit message(for the first
and only patch in this series).

Albin Törnqvist (1):
  arm: dts: ti: omap: Fixup pinheader typo

 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0


