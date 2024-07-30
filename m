Return-Path: <linux-omap+bounces-1803-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100694207C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 21:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFADF1F21C5D
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 19:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2AC18C90C;
	Tue, 30 Jul 2024 19:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IysQTljJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27D91AA3FA
	for <linux-omap@vger.kernel.org>; Tue, 30 Jul 2024 19:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722367347; cv=none; b=KyjdPFMhhD8EiVJ5PjYCcS/amGholb23W6b638iMDPaIYsqJWGPrGdfbUr6nEwEXgkVjKOBatIoLdlzmcaL5wD65kitf9rHMv2lFDP3aO03nJ0N3gohldr+4+7z42VZJcB1G0JdCrX+83MIhf/atH7YZ1kjqimysd1Cc+JPRaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722367347; c=relaxed/simple;
	bh=Gii+wpRpwvBV79w0JpC0AfUAbmfnP0nh/hhYh6g6VV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTROSveTgf2nALIkwcCda+JoYfqdmP9hrNvDopFwWqqreWmFQhiL/aXzrqFEFIoe5pzwfplVrl8rbUP4pOUU+bYRAqlOAvcl7mtJ1h4cd3NCSuRlS8F1RlQUfoOwajOkNqqJhBKZCSLwYuQfFfdL1WgPOJblPlqTO3jW5zP+VxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IysQTljJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d19c525b5so3300999b3a.2
        for <linux-omap@vger.kernel.org>; Tue, 30 Jul 2024 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722367344; x=1722972144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5Mbo7f/0r7FhjXKubpQaTwbLv4cdtUfsKj1TECykL4=;
        b=IysQTljJeA5Tfos5VQucWJPTOenZ6KLqsoeVLIaIP7vedRCoIfYpxvCrpSkZYhbzxw
         QFnXkNbovXjeAsvWOs37hByr2UZhZiipUO1A5T+82WeEniz056ULVdfu07xPvCg+fLaK
         eWQ9fCFtEBofIBYP8A71RvS7Lsc/4ha4NZs0mq7QiRatUP/PCcfIfizPkSfh6RiTZ9xG
         oBSL3xfjP4Q+I05Hba3GGApFQ+lA5RbIKm+gRZt1c7+rUGUz96WV+unRjlv2UXFwhG5w
         8r0pDz5xOHDIbHkKK+/pNsBhIQDo3ARuYVA3VNddyL3QGhagXo8ClAfnNOeaPnZmxlN/
         Zh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722367344; x=1722972144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5Mbo7f/0r7FhjXKubpQaTwbLv4cdtUfsKj1TECykL4=;
        b=YKeeGUWIDFtRxdLY1ImBTEKEmU9+cD6d6RoSmDDzgY8R2RODVQIrAO4PyNpXShsxsK
         7/lrRZwX/F6E23Cjg6RVk3XD23QAyGzhnIkYWSex5UezlCn25Oa91CHj6uuyUmnmQ4my
         forutA5mYkbYVL0Jd468//wHtALDZdKwnclmw+IHAsc1gA59baj0pQMag5sGzod85gyE
         So+yawJaz2vEO9nu2Y0ftEm3hGlZ8zmGgPVV0zxQRhtuMejUfiXflOMqWIKso7KrT8fh
         zLH1THCroDKNGey9pEmxNrUH0GddGEI0iWma1EKcam3p1zuo5rpUP1FRdRHFMHMFIzMV
         CK9Q==
X-Gm-Message-State: AOJu0Yy+RRJRx3HmaEqE4wEb70b84Xjpo8Ii0k1tq/RSTaNE01QzfAXP
	xHGsC+0bSG7SiL8PLcQHldjI9iW21Sq9lIBrHJap5LJ4xyvnW2nIOo0ahfvW+K8=
X-Google-Smtp-Source: AGHT+IHjJy5D9afJWCeHuNtfQRJmpcnz1EesxrPh3ouVuLJUp/4bnMSQG5+i6ItxbqVTfDLzd4D1fw==
X-Received: by 2002:a05:6a00:3cd2:b0:70d:278e:4e92 with SMTP id d2e1a72fcca58-70ecea12f40mr10581424b3a.12.1722367344154;
        Tue, 30 Jul 2024 12:22:24 -0700 (PDT)
Received: from localhost (75-172-120-197.tukw.qwest.net. [75.172.120.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8af1c3sm8749224b3a.208.2024.07.30.12.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 12:22:23 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] ARM: dts: omap: convert NVMEM content to layout syntax
Date: Tue, 30 Jul 2024 12:22:08 -0700
Message-ID: <172236731467.2210764.16397085645843049493.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240523042750.26238-1-zajec5@gmail.com>
References: <20240523042750.26238-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 May 2024 06:27:50 +0200, Rafał Miłecki wrote:
> Use cleaner (and non-deprecated) bindings syntax. See commit
> bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
> details.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: convert NVMEM content to layout syntax
      commit: 0f7d5b53a0fe94a890f1854c978d2a5b43efede3

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

