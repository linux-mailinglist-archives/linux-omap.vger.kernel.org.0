Return-Path: <linux-omap+bounces-3747-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E13AC8182
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 19:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E635A1BA6F69
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 17:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E5A22E418;
	Thu, 29 May 2025 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y+lCTofo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5022DA10
	for <linux-omap@vger.kernel.org>; Thu, 29 May 2025 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538680; cv=none; b=lFppnq64HEWFrhsykoCfR01x4ieRYFEMy4NxsvPBTTTQ4RdaVrQr/txXHo4D5R/o4t59qyt4DtzXnoUr/2n70AneG7rmpE/4iCwCNvWJUoq3tKCwALhq9vdMaj0I6vF/xHwAyTNNCKUP68R7Fsx2MyqJOhT9EaCeCOzPtyzQUjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538680; c=relaxed/simple;
	bh=40Su1GnwAmr6AztcWQ60IL+CHixZCWxdkTxtFsfZWuc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LuKi+/puTnJyHI18AUECB/26KoY42PaI25nZOolojUna9oggPO9fb56GaocLdd324kV43iOKAxoTL3sxSWmdEbE0q5HX89MGVCAuSiokYAQc8r2lu2/cg3kTT2BqR+xszXYQnPwGWpZOlwgNaHnVveOAgA7p2PogSLx9ZvqNGlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Y+lCTofo; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1fde81de05so678892a12.1
        for <linux-omap@vger.kernel.org>; Thu, 29 May 2025 10:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748538678; x=1749143478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNwkLAnqK894as9s9mKIIiJB+bRwSGT/2fsFsNmBFKc=;
        b=Y+lCTofo6i6HhYJIQv9F+7fG5dGHrSFqw16TSd6KO5BmxhlYDo/cKYe0DjYcoMwMUR
         cqoDO8QsKI04I+MXdrOLiL9I1W3cQEcfhi6QyBN4WZePdF++AVI4+R/V4hg9zExS600h
         aFeNXZh2ycFtYt263p/yCeIYrQ8eg6r/NCFQOMHjdPAoym4ysbbRM3+yJBPHCxOQiSlT
         VMvBBwvRpi0dHU9aopAUXoP07H7QyjtLOKSFMKeB7F+nd1B/jJobAJwLSjnYH6d80Duz
         QhisGSS+7XeI7CYkVwY5QeK9iB01PPUnvjK7hqlHlgDgUDoULELfHMPC/U500iWjKIHu
         cZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538678; x=1749143478;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNwkLAnqK894as9s9mKIIiJB+bRwSGT/2fsFsNmBFKc=;
        b=u3D1AWk7ILgkkiUVMIGWCsinsFCWfjr7cvIUBBSWGem6mQs6GDdAxKTX1HyalJuMMV
         ZvFehU5fXT+EaMOiMZfS/ok1s3NeYwznhA7SXNDI0RNwQnI+vukvZ91WounTIvd8ww/l
         MJ4vk8GiVn+zEfn5HuZ8GfMlQHGU2HT/4C/LfTg+NAtMRi2/RdlyQ+No4E/FjgBW/o4p
         QXQrDzZ7LCkJ/ptiC8+EPfdPga/NtPVsO8zCmmIMaK3ehpZKPtz3qnw7/phwg1ottNcL
         5FzNybDMJWxfQZw+vAaxwwK/6guplMlCR0T6R21hcaqNHjjbHjxsT7a49KcYyKbjaOLD
         RpRw==
X-Forwarded-Encrypted: i=1; AJvYcCULKEDw/UHw8Z2GNu6TcCOz1B751p1Wjglm3thgY4Logw4gHVd9gT7RaF67zZ4qDKpXtxzaF8Embea/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw93Gu2PPZsup5+hO/GQgfpFZU2lAJ0kn8R+OwuvkmftbO0ipGO
	mAu98PNl7Wl0JBwNrKcumTkbS0R8wyZI5LG1QYxMaQTcCy6AlUpqW8e+rogzFXJMiFw=
X-Gm-Gg: ASbGncuswi4yluI42uuIl1qmEVlRSx/UiLGroj/++dROimY6Lc04f+0uvvErGT6iVh8
	ruynvYveN9uqqq+1aMupmFMjKsJtmmtz6AF5mrI3Od+lE2MBQI2nnbC2lqQZUlNyZJK6StJ1NA1
	awd8BJ9zA8cQ8CQu4pYgADW9G3Orj7xUqmPWrey7QKueYxXivfGiIuHbtd/WMWNtmgjLoOjHKRO
	Iav8NTUWGa8GqHs+KExd81lEGMKbSfvnXgv3FRdJUsCUyxwe6JiTiUPZlxiAXAei9weXBeGXhrD
	oa5oFYAe6XXp4Q6plHcvgOTxjxY3Jg87USc/EoLS0R84vcr4Mg==
X-Google-Smtp-Source: AGHT+IF8U4LS5Ha4ZVJlb6Xexvhz/gVZeJ8PZz0LFT+vBQf4rmFuB/wcLf4M5M+AqpPj3eAYBAnv6w==
X-Received: by 2002:a05:6a21:516:b0:20d:5076:dd78 with SMTP id adf61e73a8af0-21ad9966437mr590567637.42.1748538677957;
        Thu, 29 May 2025 10:11:17 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb29b20sm217068a12.30.2025.05.29.10.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:11:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: s-vadapalli@ti.com, Frank Li <Frank.Li@nxp.com>
Cc: bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, kw@linux.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, 
 manivannan.sadhasivam@linaro.org, robh@kernel.org, tony@atomide.com, 
 vigneshr@ti.com
In-Reply-To: <20250411153454.3258098-1-Frank.Li@nxp.com>
References: <20250411153454.3258098-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] Revert "ARM: dts: Update pcie ranges for dra7"
Message-Id: <174853867693.3632160.17627654159190851191.b4-ty@baylibre.com>
Date: Thu, 29 May 2025 10:11:16 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Fri, 11 Apr 2025 11:34:54 -0400, Frank Li wrote:
> This reverts commit c761028ef5e27f477fe14d2b134164c584fc21ee.
> 
> The commit being reverted updated the "ranges" property for the sake of
> readability. However, this change is no longer appropriate due to the
> following reasons:
> 
> - On many SoCs, the PCIe parent bus translates CPU addresses to different
> values before passing them to the PCIe controller.
> - The reverted commit introduced a fake address translation, which violates
> the fundamental DTS principle: the device tree should reflect actual
> hardware behavior.
> 
> [...]

Applied, thanks!

[1/1] Revert "ARM: dts: Update pcie ranges for dra7"
      commit: 8c178057e734188eeeceaec33848eaca2766ca07

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


