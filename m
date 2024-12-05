Return-Path: <linux-omap+bounces-2784-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA629E610F
	for <lists+linux-omap@lfdr.de>; Fri,  6 Dec 2024 00:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5BF18857BA
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 23:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D65C1D5159;
	Thu,  5 Dec 2024 23:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cVPp2XKe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61B1B87F5
	for <linux-omap@vger.kernel.org>; Thu,  5 Dec 2024 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440023; cv=none; b=SJjvxzkgtWk6uya3DiB6gvfVISH+zBcGYeXZ8DObgfnaeG+LyHA5vwtP8DQr8qdFfm59osAZUmHaF1zXYqN4VYYDqAGItLW73EFe29CwbUM+YTD8Pt5Oqms202D2hetk2Z0OghNanAchFqt9zuqUXBGTXFNTf3yRqK2FXU7f7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440023; c=relaxed/simple;
	bh=UciXj6R8kmj7F1nkPNLftcUuWn2zjjonY7XeTsiisyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dWb/GGrKA/PQVZUza8GTyczMyv3HDInCS+/s+wWKUoDBjfydUoVIFDxt42qlfMP/iZnjd5MqrfF8uhPsQaATLaW7N2A1MdAjvdP2Tcd3SZTmV/y+y0ImnRd8eQ+gnO5kvC6V2E7YnaTbiqkYYd6xsw+bvBAHdDNZY4vIqsT4dDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cVPp2XKe; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso1267881a91.0
        for <linux-omap@vger.kernel.org>; Thu, 05 Dec 2024 15:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733440021; x=1734044821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cfmId59vxiNvq6eQ30QkQNn6nuXdIqcNwMG9TRCwVI=;
        b=cVPp2XKesf4ltGnkcHkA+JjCxU88rJTYqOXLX/RrkGqP1gISqUyPdwdPvIihg026XK
         u5LOC8eRJ0fGtGxo8/Ij6UHDnrS4svhMGZmVAxezXsQ5ISYn5XePWtOMeU04EGpvh8r1
         dUs9XTsD/zkWGXqDnNzPTU1gqvG2wiwCgavoYlFG8U/myvrZjdFmpr0KZAISfHeuKD7S
         dstr4mHMITuc/45nnoFkiz01SFVLkq8wesE1K6HIzRoxDb6aE5tmlSen2qRtwjWlRT/u
         64wNQTTm8kjMXtGIlbhxRubAFd4DC/HMM3A1Av4kj8QJON2PjA2A1OzSZkhvd9/sP9tr
         mbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733440021; x=1734044821;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cfmId59vxiNvq6eQ30QkQNn6nuXdIqcNwMG9TRCwVI=;
        b=qURV26YHwd0Pu5NBz6TnA+VxIlAL8CLjwrUuNFd0+Irvj3pALLawup+1D4dXJIJMLz
         zdyb9g7C2JCe8plpPgN2mAOgJXZbtsr531c7plobM8MGaN+IwAuT3k7PFWxeFX/y+yqs
         ypoJn4IFui/BShEIvzkS6E1oDN5guPfpN0acw3M+lVbqyUAG3dHOnWx7EFWzMHBthQni
         M5uvmAKMgRBxBgOjtFfzkKlpQAI1DecyU8Xopbudvrkt1I7b3lIRpqKEIQPrjfKsXKR3
         sP6rU3HEHZ5dzbbbgFVXUP4qt36CYIP/ovfG3TdfKgxlOhG5+C5d7xHzf2h1EJzTDrtN
         QnLw==
X-Forwarded-Encrypted: i=1; AJvYcCWADycu/zFQMXxUtc/+CNvM590Ly6MHoN+ldzZEnx79dIHjNGfxwLdOvD3s3zdtFLSJNwbZdk7ztno1@vger.kernel.org
X-Gm-Message-State: AOJu0YwerJa5QNwCof0ipzREqcQ39i+rh9jsCorLzGVs6Z9LY7WVbYGN
	stNTNTVm2jKqs7LccxaNBA5ufcZg/CVXpdzqpzd364OR/JyQX0aB7qD/kEBMcnsFWgS1K0zODL1
	QlP4=
X-Gm-Gg: ASbGnctK5KG2GmqXoZiWJQE8wjGLkyf6F4jdOPln+0mQv3ytO9cBTlGR/GVcIdsD15a
	zhFUEC8Gp5IZPDw6D2BxE46o5GlEDrLbxpg/Cur7fvHqoA7fPtCz5SVM+8EvFUKIFXA4cdyIcs6
	JPw0bVhu+XGr5kMc3yOurtjBTUpGTTnd3rkkZxwGfGtnbiUXCRicNOWqe4YfStj7gwAjr6lWAN7
	a7MyZgWj4I3864nRV3x/+2Sd4N8aXMfAjTiZFV6N1LSb2fI
X-Google-Smtp-Source: AGHT+IF0lJnHZZwx5qW89pY3JM7PmU56DWfppWtG1IiiileeHZLO1SZtL+I4lEvD0dwQNQWcZ0pTbg==
X-Received: by 2002:a17:90b:520e:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-2ef6a6c112cmr1324606a91.20.1733440021483;
        Thu, 05 Dec 2024 15:07:01 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45f7d804sm1938792a91.1.2024.12.05.15.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:07:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
In-Reply-To: <ec20fd5c347bf74963532e95282f850d209d84d5.1730539664.git.christophe.jaillet@wanadoo.fr>
References: <ec20fd5c347bf74963532e95282f850d209d84d5.1730539664.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ARM: OMAP2+: Fix a typo
Message-Id: <173344002056.407600.10771943462992727832.b4-ty@baylibre.com>
Date: Thu, 05 Dec 2024 15:07:00 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Sat, 02 Nov 2024 10:27:51 +0100, Christophe JAILLET wrote:
> A 'a' is missing in "powerdomin".
> Add it.
> 
> 

Applied, thanks!

[1/1] ARM: OMAP2+: Fix a typo
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


