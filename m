Return-Path: <linux-omap+bounces-4847-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC585C3357A
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56A1B4F6ADE
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B708347BB3;
	Tue,  4 Nov 2025 23:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MfeTqO1D"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF352DC332
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297624; cv=none; b=dPhLhIRY29itDZszOf38Xp0x3q4YPZszyYCkSAQPf8SBRdJbpn2scCexIq507TjgPagDeyCsBTGL5z1bA2rsSCUPmBfnuOKtmQUit9eZ8jmhLkHjWpej9epIyzKdzKYSbZ1q8l1+KUCXyHtd9xBKsSaXxZbZi0LzxMZBdtjRknA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297624; c=relaxed/simple;
	bh=yHkKXPbR33zJA3OGgfovSgAEgZn+oC9vSJyjIjciccM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uQ4fWwEp9w5rbyB6djszgQqv4G5KTfGu0mQWaFs+5qU5Ky13Fcv/IrXHepmo9Y5mXj/xf4KWvNUkf9oo1aVrS2JmQ5/lfgqbuJFUkUv0DCpSG7YNSMdkD2diS6/977fMUkQK+z41vlgkgFaN2tNZueB9o2ZEIWaY5crp+CYTvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MfeTqO1D; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781206cce18so302298b3a.0
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297621; x=1762902421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIQrxW79ZVgRUN8Wsqvx7zHmiYo35lAP7L+li0aZHjA=;
        b=MfeTqO1Dvc8gouY2B2MNvQcXsm2O8X03r/Lixk7jAziZuiOeFhg1SyTpjWVkEfhz2c
         ykr5/EWl1hFW0yrRt4PwJSX0mQM41w0zLhfHoSCSnTsyOdbTo1cWUwTVDhaPTjEKLh/z
         ePtdeekuC4Izp31jNFWLrTMOhjG45oNDA1nWzLqSH50VqtF2UvWck1mM8Ovd1eq9Vl+m
         Spg/mMZhTfOC0Hsjeluohu0OthqwbSBMu1AtrV9WlWt6DmZs+wXruxjfvw33I9DYuuyy
         dEX8kbwO+W7F386i6Yy5GaK5ir8IowSDJypN+Jmvih8uFABlGmi8V01o9QBNC8IidIOT
         J9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297621; x=1762902421;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIQrxW79ZVgRUN8Wsqvx7zHmiYo35lAP7L+li0aZHjA=;
        b=tqcgjkFY6DWjgGXwNEmCi/QFKYWmo4FS+5PVVPrIV2RAs/4VJ5EigHAv4z3S7KgYnR
         uXu01gQOn5lnAn+WgsRj13VKIjfQyUWsXBR4bTP+6r7ZVXg47shfjGWj2wagumRZna7X
         Hqpeq2Sy+sdvf9aW8PXtnRxHVPaVemT5Dy3RG3eG8MTwzCAWkiHJ2+vQ00jb7HM754Kr
         eFY8jcDOXrKslDpaxJ1B+yCq1PaAyE/eamy23TBz31yLJByailjj+9GTGuEj/yWWMgjt
         X/7caxv0aqtWhbExtQvdGPPatpe5vh6GlJgCePQbZdi+w9TtJt4m9rkeQF7n5S34PPxE
         sgEg==
X-Forwarded-Encrypted: i=1; AJvYcCXOZq4VWNDyV468+9sgKIHWmj8tjsgLPFIpXvdSkkF87u+McQkuVbxnAxZxZUB/61oZahBU/ETxAS5q@vger.kernel.org
X-Gm-Message-State: AOJu0YxKNiGHuMiKu1XZaEj6z1r4FAQIWSRdijJAmm5kQaMkRTQS9sRK
	Ogzbuw2CYLxwgY/bmBRutdSVX8Wbz6TuZGGG2le8gMfYTHwyzgkbwMN3/fkLuUNl8Z4=
X-Gm-Gg: ASbGnctz5cWGlxuiAJ+tZIoV2HmrmXN5H5FhL+Fa1fmSufBMCafwZs7Fef2hwkT2SlW
	R7r4ATM0LK4Dnnwih7LwAj2EpE/dvnInTDKnbGIvQwyvHLPszRyuZT+VvPTfKXwFzdvPbL0mIgj
	uuU1r/DtmA3vebvZXGzghGooOMqnjvDzZ0wi8MAKhJsxUBSeQBo4hNa67ELbdSgx3ezaTYPbEJp
	3MojMBI5QfmSqBb+A6HejNFVciE1ojStcyg1Y8aHbyIqBVvrgMyBv1jI+SBuwxVufneDF2CwuRp
	M18/UjqKU97OWBfevHeJ2wU0dw1+CQtuswg8BvyUFI/pyB/BQal99ABZzU7ocz7cUyyt5nibkTK
	2wd+pgtWDNDdOAnd8b+1gHBT2KNkO9uO3EZu6Z0US2jOXaLHl8XB4PCrjJtYcDVRwcMDzwCPUAw
	==
X-Google-Smtp-Source: AGHT+IGGdQvgI/Vf/KKbauI1cOuwqSxlp39uLs0QpL5udfp/2y8wBHW57wYN3h5DJcHi+fIfaHZvoA==
X-Received: by 2002:a05:6a00:9515:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-7ae035df724mr1524948b3a.1.1762297621600;
        Tue, 04 Nov 2025 15:07:01 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd5d5797dsm4147472b3a.49.2025.11.04.15.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:07:01 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
References: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
Subject: Re: [PATCH v5 0/3] dt-bindings: mmc: ti,omap2430-sdhci: Add json
 schema for the text binding
Message-Id: <176229762078.2840692.12323662945445152208.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:07:00 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Fri, 24 Oct 2025 07:57:07 +0000, Charan Pedumuru wrote:
> Create a YAML binding for ti,omap2430-sdhci and fix vmmc-supply
> property typo for a DTS file.
> 
> 

Applied, thanks!

[1/3] arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply property typo
      commit: bb2ffb47d82229a4f54ca6a83784fa288914803b
[2/3] arm: dts: ti: omap: Drop unnecessary properties for SDHCI node
      commit: 9485ba8ab325c4b420ec92661f15ed14741bb9d1
[3/3] dt-bindings: mmc: ti,omap2430-sdhci: convert to DT schema
      commit: 333fa35fbd1f20b0d8a4af3b236fd9f52f3431b2

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


