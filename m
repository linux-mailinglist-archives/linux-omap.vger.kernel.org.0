Return-Path: <linux-omap+bounces-3008-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5ACA0336E
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 00:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 466D618857A8
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8F11E3771;
	Mon,  6 Jan 2025 23:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H7m6s3GD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982841E2842
	for <linux-omap@vger.kernel.org>; Mon,  6 Jan 2025 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207156; cv=none; b=UbPLmLUgL9uwm/nmYbGrSdf86vF6VB6AD12IiZ9k7ZXgGuxfJ1Ka1IRIsstlRxB9Ujn8UnCZBtwLm+CUFyv5EfK18dnVK7jT38mkYikVy8qPITtw8t/NMa2R9OnYj3oKpKhuziAG+T8bqt3+InJkVM8HVmXVEvqIk1Qm4ETYNRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207156; c=relaxed/simple;
	bh=g+3Sxr4wbiVgOL4m/NPcm/nr1EuA023ouaHNZp1AGd4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nIHq7Ml5uMGa9Lkp0IXVp0DY+81IOQx2Lk/j3+GWFbfCt16nAeiSLhldu8EaCSzg7/jleXIUd9eArqVbXWOs2QOaRlMp10Kq/RfEId2N3NU5dbdzsBgQPiPUSUOewjkrU3QZvr4ESFOLbi2OBSPoD9hf2rAu9/lnH6pmQyZriYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H7m6s3GD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216728b1836so196871985ad.0
        for <linux-omap@vger.kernel.org>; Mon, 06 Jan 2025 15:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736207153; x=1736811953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae7eX1VcrbWOal63x+hvMKIWCXRYTfaUhj7cSqAJrEg=;
        b=H7m6s3GDPM/XGkTfjCy8Su0lYfkAxIuXV0UmY9py4/ANgto5oWeP7c6WEj9tkSFqqW
         +qF0DQkRRNvUSGoWcRO9mLf42iP9BzjNyLMlSYBggAcljN8K8dSmIQjs9SgzaKUJU4R3
         o/YrCWFM6sU+W1QUOtOkMCWIuyr4R89N1ZQX/puI8dL8VNf74EOboXLCyzXXjUbyM7lq
         FAaVUIuQlw61KleLHXapK0EnqgpF6W577eHKMaV49cffeAp99sLvTi22npcKxZLivdym
         ngRCMZpPSKfn7woEMoVX/RFACmTnVD5RhuYrVnrWL5UIiFzyXWt6DtOuNDYH/VTLAL5d
         63vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736207153; x=1736811953;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae7eX1VcrbWOal63x+hvMKIWCXRYTfaUhj7cSqAJrEg=;
        b=p9W/BXaRCqssdaT5ULPN/1+HtlY9RQCRwaT56BqHactOOsWFO5Z0haGIe2FOGWiFSn
         SHZXwdYUQzWHxG0bRyzjHZJTbp1m5M4yswGo26wH0Nt4oLvHo/dMFPj8u3GJS1t8IrkH
         /BxEvvyQVASp7A5PNdr9NITtsKjC4YKMHHuyaJ8tkCemRbRyjSBMqg8b7ht2RMQ6GiIc
         zHR7c1EQiq+8N88CNURZH36rUglIZf9vB/wHwHOWkGiQDk/cR6bHDey04SdksDVylYxO
         clO7USo5SzC+judfbaiKLX0uisjDTYW/RT89t2XRpZsUiGgboOKUDy23iI1SDYpNcYr6
         O2lw==
X-Forwarded-Encrypted: i=1; AJvYcCWsJeiJLll2A17b4SLl472qcPpBxVm7kR9+Nd0lrDQWIjwv7Pv+f94qgooBWZuCNyjGlSspx3go4iXP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1CflfHyqUXsVoOUA/i7mkqSVvvTT60CJiGdPGWyiNCm+1FZbi
	QqcZvzR3VS481no657S/8JDxY4DB6f5jE4z94hlquDD1xlkEid8nhz7efC6ZDG7FgHioJdcSIx3
	+
X-Gm-Gg: ASbGncs17lvV1EnNTHlEN9z51z33iFvd4H6tf1HsvYEbggjaPVzpoMi36DXGYP3sjgG
	sCHWdUOJgcogQmARmKQqaiI/ExYz0oMJ2KxLudVT9dXjgnO7791MiWU3yvyHBi3Je/S+EGX+j+i
	XHGf/dZitxht8LRzSL91Pus+y8MRaOCO/ctKAUyOJuoSfWOjMDC5E/DD3M6AxnH4SMmBlxlyh3Z
	S+l0pKu7MIqrtqK1wz7SeHEkxBgOV4TfMgLaU2hUs4Zh3J6rmGyTWw=
X-Google-Smtp-Source: AGHT+IEyj/CbdGiIw4oe//fTvu0d1C6QeCGfXb3QIrnjF1+e1FD5isTOw1FMoA0flm7N9cEayQ9rLA==
X-Received: by 2002:a05:6a20:2d07:b0:1e1:b44f:cff1 with SMTP id adf61e73a8af0-1e5e07f9c06mr83863396637.33.1736207153545;
        Mon, 06 Jan 2025 15:45:53 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb9a8sm32211279b3a.157.2025.01.06.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 15:45:52 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 linux@armlinux.org.uk, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20241229144459.9742-1-andreas@kemnade.info>
References: <20241229144459.9742-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable charger of TWL603X
Message-Id: <173620715274.32831.12985016138338790659.b4-ty@baylibre.com>
Date: Mon, 06 Jan 2025 15:45:52 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8


On Sun, 29 Dec 2024 15:44:59 +0100, Andreas Kemnade wrote:
> Enable the newly-added charger of TWL603X in the defconfig since it is
> used by the Epson Moverio BT200.
> 
> 

Applied, thanks!

[1/1] ARM: omap2plus_defconfig: enable charger of TWL603X
      commit: 643cc5ca01ce462f2e2856eda60400e9a7052bb9

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


