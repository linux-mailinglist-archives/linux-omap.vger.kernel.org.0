Return-Path: <linux-omap+bounces-3618-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF6A9E3F3
	for <lists+linux-omap@lfdr.de>; Sun, 27 Apr 2025 18:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A9C173CDB
	for <lists+linux-omap@lfdr.de>; Sun, 27 Apr 2025 16:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912BD1C831A;
	Sun, 27 Apr 2025 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBssuu5r"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C186218C03F
	for <linux-omap@vger.kernel.org>; Sun, 27 Apr 2025 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745771220; cv=none; b=p765Xb44uGOBmEWmn1ayO31LCTvTp7pk9M5y48kKAfGk0A4mwfSyerGi1fBNHHmQU8h9VbIBa6On1v1s8iqvER7hoG++a0OIKOMUq77a4hOTQVUREy2NBOpLQ+c8wkixfr/pAvCoQDia8yeEw99ol4BQLb4guryrQGJAPdPQB3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745771220; c=relaxed/simple;
	bh=gK/GSzH9Orq/qWZ7kN2L7Q4nJaH1G+CWqxeLvWpcZrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7QNvZgi0Wv5avpckATE0j+Zu4AM4MBD89B3K8ODAiYytPJNp6hmwFSnI8pgMdH4Ywk8RrJ3DLbJDdqsmXFH4e4cN6Djj9I/HNrqtOlBSWZlYUZI6h5EVYUp4yrsDj7Ew4/jpdPpT3IRiMYDhu5eo5GmAqd4YSKBeTqMFcr3swA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBssuu5r; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224019ad9edso58398065ad.1
        for <linux-omap@vger.kernel.org>; Sun, 27 Apr 2025 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745771218; x=1746376018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Hm8ymC3WlboH6v1puutB+PkeMUv87jriOcmD+BHZJ8=;
        b=MBssuu5rB7t+EueylX10Mtl9cHUpep+Xdb/9vLuPPNUWCsojFUGU5EpyCxxGsDiez1
         jv3hKq6oK5u9OFUoUNPYbVw4gmBB8Zp7IeMOSAU/M9EDTcKlGU0SxDiX/xMzcmlyKjrQ
         0DIIXzuaGhIhqlaXilJ8lgA0ThpWvNWlfPWq492IbcFbMskIgGaFdsb5Ka7qc+gNhqwO
         pLGq74xVKnMAttc2j6JR9mjvZn+CocP4UIsMJgpnafYtn/3APB9iDBi+1FkEfT+6Hydd
         P0fUv4TqRwCSlHZW6HjDR5sgzvopsCqEWrT+QhSyb11Ta7GTNH3NQaCvWCAjfWG3RkvA
         A1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745771218; x=1746376018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Hm8ymC3WlboH6v1puutB+PkeMUv87jriOcmD+BHZJ8=;
        b=iiRRek2xgrRceHK1dhJk+JXxrmD/YEFPnyguCBNwLT5HJsavrJB2TRvtnGvoVRDO3O
         pjUScfsHtijCn8Xw2A6/nrRi46yzcPhuA5jS9aw3xmayGWTRl6XX54pfQQB7gk+1YxW8
         eGG25ehqXHI3aP8w0v9F1LgKmzpbidWlWgn7loqhWqkJuPccZGoHOQywME7iQlG/Jitq
         i8RYkrvUACh3nwm5AJ93Abg3aw0/JvCjT6iFI8f6wIGdxe4YVHiXy+kHo6yr+OpbCPYd
         4Gcceus3RsnFjumkl2Z98IZqGiHvT1g2aSeMhpAlQlAKUNN84Zqk5CGNriTMZElgbaMM
         cgRw==
X-Forwarded-Encrypted: i=1; AJvYcCVIckituEJ8sN1/cDJ/PrxjOHN4ecVbPmh8qD0oqDkp5kC14ceiskyCVbeyfH7fVf0EbzI53X+zSH3b@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj7T8z9nh3k8QEMUie0PmmthNzxof28+wgLjdeQuOK2cMQS0bD
	Csq9OdUWng5qYyNlggSJ+7X7K7f5mbvML8VJSLNugqUhftJ4TRI3dHa4x118lg==
X-Gm-Gg: ASbGncs2gv2lujsX1slQ718MOYnAGs+BFAE4iojvoaMvaryqfr8mCk/cnhgcrkC3jRH
	HINhsKtR7++b4xJVD6rUnSeMuxY8Bb3N/IcqC2Iyi9mNJRu/CpjH2rSTpOqU53PJhjyWbJdIgu6
	pgTPrDDXoTlmiYfpI4ZSD5t+maIkACg5seS5uFpM0iLLlmq6aBQccqMglMlLvJcDjBRVWNjnSyN
	H2EISylVYbNCkc7sgU4ixqVySuHonUzJB0EzYrINuMNq8uAqzA51M7n9tjtcmvnIq6keBzLHruM
	j54uaxz63tBDUKokc08M11n9Nn2IO1LOkesCx5uvmNCAo4pksUp7
X-Google-Smtp-Source: AGHT+IGewTBDql+2+UdyTbCLzjXJegcsr5fvdoDv6DORAwSGJR8R6yqyunL8uBX+TIfarA0AmXkmwQ==
X-Received: by 2002:a17:902:ccca:b0:220:f795:5f14 with SMTP id d9443c01a7336-22dbf5f0b82mr130834365ad.27.1745771218030;
        Sun, 27 Apr 2025 09:26:58 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216adbsm65705855ad.234.2025.04.27.09.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 09:26:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pci: j721e: fix host/endpoint dependencies
Date: Sun, 27 Apr 2025 21:56:46 +0530
Message-ID: <174577118328.83097.3904673051712701084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423162523.2060405-1-arnd@kernel.org>
References: <20250423162523.2060405-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Apr 2025 18:25:16 +0200, Arnd Bergmann wrote:
> The j721e driver has a single platform driver that can be built-in or
> a loadable module, but it calls two separate backend drivers depending
> on whether it is a host or endpoint.
> 
> If the two modes are not the same, we can end up with a situation where
> the built-in pci-j721e driver tries to call the modular host or endpoint
> driver, which causes a link failure:
> 
> [...]

Applied, thanks!

[1/1] pci: j721e: fix host/endpoint dependencies
      commit: 10aae64c2fb5148409cc9beba7f849a79fe82f17

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

