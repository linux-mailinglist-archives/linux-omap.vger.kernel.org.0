Return-Path: <linux-omap+bounces-1999-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7643895E344
	for <lists+linux-omap@lfdr.de>; Sun, 25 Aug 2024 14:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA8D1F216C1
	for <lists+linux-omap@lfdr.de>; Sun, 25 Aug 2024 12:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A530154BFC;
	Sun, 25 Aug 2024 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wi2iys1i"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D811514F6
	for <linux-omap@vger.kernel.org>; Sun, 25 Aug 2024 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724588535; cv=none; b=HkiOVPlGynIREPdlKcJ0aM9h+4B3pQSyQXmB0LDG/XGQuuOt1N38xCspFFL5makQuXFNBf4Nn39jErE/DvyoAuY8fY8ZhlTJYtQ/GWhbrlUfq3XMcEb2QuvnfxhHc/dBYzxplLmIDJxPdiWvWGm684YIgCuN4tZwCjX3W35nAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724588535; c=relaxed/simple;
	bh=nOlnXZVyFQnGtXmZw1PgiHD2dW7h5Rxp/ETlB7JrDeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pxXl+MZHbiymJPJBttWdVC20I17P4Xa0SdDPqSshL5+yGsYyR1IUpimHUgWyE83fnCekonacrG2F8O4re9Ieo5nUIOYy+q+qwHbLeHx21purHP4zFEnGcI3jJSWfvElmqJxwtbWaGOVUfSqD+Hi4ajpB0bRIgmMMPJ8PHyMfxDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wi2iys1i; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4281e715904so3867475e9.0
        for <linux-omap@vger.kernel.org>; Sun, 25 Aug 2024 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724588532; x=1725193332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+UgFtaj+pKvJ6AyGSfdOhmfzI3eHNWre9y2WrDOj4E=;
        b=Wi2iys1incnovGG+jvisMJKkrPeKDAa930JV/zCPnEpdxalpUZA1rsoDt3OmPiANKt
         kKc5FhbiZe+jjY+T7P4DyyNUReWsH7NVC13ca379N9+ACG68jiLADV7VKxsEC0scuE9h
         LY/Imw5CUys+OfaIoEsSl6ueg0zyLBNpxr00eHdSLprPGqYTKFNry2It13a2lWidrzwF
         jgDNbM01Hfqn9NMWr6WojHJXDH7U+i/KISIDsFdYnfWjunHSW6rVoJzfSJ2xFApIXmzf
         K1ar2xmBx7f9ClUqIiuucr43MNyDwVX4Z8dYH49l64jOSOajrvQqFKrGia0CCr09ih4+
         hxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724588532; x=1725193332;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+UgFtaj+pKvJ6AyGSfdOhmfzI3eHNWre9y2WrDOj4E=;
        b=UWgJT1xP9Ew20iOOBiATg4sQ/azxq3/uqN0Qoqtr1GMQUZj6LzQ7SBuFfg+lbOt1gz
         PfYnX/8oUdJhaNYbYeHSbfqgdOYjQa0kI83TgxZBznV/xAkUfuJrutppqhWU1xk51q7n
         gJRnkhlaxHZ5tOV147jcGybtpLtrApMPn0dMJtiTMZnEHZRe2I4gQRJuBce6CqN+xD9g
         ZWqqnSkeRUBbjYuW1M9HY3/0xwGlne2hOHGvsBOeBrBmJDwDE3/uwpH/fjPVL3umJbxF
         PweYSd/cM5Jfxr8dKwLltyohGKbc+R2rONMMH2rusEKw+21wOnm7kwQMNtiXqxAxjcjp
         GqZg==
X-Forwarded-Encrypted: i=1; AJvYcCWy74TQzc+PBjS4fdoGAZf0l8nGQHmra4aTObN/1jyYyU4m+5ycRbL/E4G0n3jnnvv/gRiwPRqOSsez@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaz9Qxa6tMNH7LkkjesHTOD+mpdKfESnadpbYfuoxTobrz29BN
	BvXfQlamyL8qpeDASmNsfcmXHHC1cGL5oqZECFJlHna5cKYwnKsltdXFKKdArsA=
X-Google-Smtp-Source: AGHT+IG3dgHwRa5RvxTKEo+QqPF4xf0IaD1bS+tXXciwrR0DeYWZBiDZzmArlS6/gwFfSMnlTohzpQ==
X-Received: by 2002:a05:600c:3587:b0:426:5f08:542b with SMTP id 5b1f17b1804b1-42acc8a89c1mr31271945e9.0.1724588531419;
        Sun, 25 Aug 2024 05:22:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef81777sm156774065e9.27.2024.08.25.05.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 05:22:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
Subject: Re: [PATCH 0/7] memory: simplify with devm() and guard()
Message-Id: <172458852919.37697.13346421757705413100.b4-ty@linaro.org>
Date: Sun, 25 Aug 2024 14:22:09 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Fri, 23 Aug 2024 12:15:55 +0200, Krzysztof Kozlowski wrote:
> Few cleanups/simplifications, of which second patch "memory: emif:
> simplify locking with guard()" might have actual impact (RFT).
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/7] memory: emif: drop unused 'irq_state' member
      https://git.kernel.org/krzk/linux-mem-ctrl/c/99602b4d30359f971247f8438afac57cbd1832f0
[2/7] memory: emif: simplify locking with guard()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f1619986d7e996eb6e53c7fe8ab32e66b17e1cf1
[3/7] memory: omap-gpmc: simplify locking with guard()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c93ad423edd8a42a6666241595043f9193469f9e
[4/7] memory: pl172: simplify with dev_err_probe()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8f3cb397cbc1e3b18081738af87171f960bd112e
[5/7] memory: pl172: simplify with devm_clk_get_enabled()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/610395de8496c34919f827dd194bf41af20c2bca
[6/7] memory: pl353-smc: simplify with dev_err_probe()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/49ee2e842a40dec16ed4933bf2cd993c709f12a3
[7/7] memory: pl353-smc: simplify with devm_clk_get_enabled()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/ce536578e5652ec4da10ec69436d2ae2548bd619

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


