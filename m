Return-Path: <linux-omap+bounces-2822-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F169F1E23
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2024 11:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848FB1888CBE
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2024 10:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B7618EFCC;
	Sat, 14 Dec 2024 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cjJI0uiN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546C133987
	for <linux-omap@vger.kernel.org>; Sat, 14 Dec 2024 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734173405; cv=none; b=awEt16gdWG5Xl4ah+SMG1UBdNr9febHPchzWONthdp+CAY1v/GFhhAZAAxYYX+pQh90spnIrVBm0TEHrKRvTJlI0uNInTomfOKB84iNWj06+Pfl7DUcfYndGs+C8EgjhImReCZ9tuW2QAeBf5c9fQA9mmvEb7JEYwuJsRKAyXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734173405; c=relaxed/simple;
	bh=WgLZ4Sqpo845875rVbQWeq2Ll+Yen4xIdn1IlHpXYyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MVEPjskTYYpc5Gox/qC4zFylw5tMv3/fuqHrpJII9D+sp1z8WAwgnrUMfqOQ3pnQs1/HHvTOAOmxx3wHaLGWxnIS+dHwDkt6Fv1sr/tkJ6LKbM28NL3NWhs7XaP0ut25Oh0gfr9bk/pDpPPNVbdz4D6oc1RKydUwtr9d4+Ua6oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cjJI0uiN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38636875da4so200248f8f.2
        for <linux-omap@vger.kernel.org>; Sat, 14 Dec 2024 02:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734173402; x=1734778202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFeeaOwVLNJyk8KG2PAdcvU43PbcoLuXwqtb4WTqOv8=;
        b=cjJI0uiNjz7O/fYdAgBrv9ECxsSbgvy+VWaJNIhb4+tgxxoutRIWkLRCQ56V6YQaDA
         phHZx6T/RcIqIYp9BB6mVzdyqEw6sqIgd12qtOBFYodQ1kLg5D+gULmhJ6NvsTTlARk2
         jqGv/3fe7+yhkPWmLnJh6jI12hGiskK/XD8Tl/n5IVAdx9kitqdEm0xAed9dSTJLxVAz
         D9dR9wvkVY46/7eE2IS58PljGEBBv1ue1CcnHSXnieEBehuU3wqL8ap2kEv3YjVaDjQZ
         MRLnmKhvwycsi0e4KNt05pc72CzNzYPXsEW+BwWnxVDEq5BQU2nwJi7Syu5ZLLUrZDht
         zdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734173402; x=1734778202;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFeeaOwVLNJyk8KG2PAdcvU43PbcoLuXwqtb4WTqOv8=;
        b=lB6t5XJcmboGmlloguK7rh4KXya+1AI6rKUJRX932ECbpsipNZwVTWAsEU/QovCC5x
         VeBwAfTAVxZ/zl3yo7eUOvBvz987Clfjr1eS7+yOp9E3BaRCadiSuSihhK+GZ8R4csCA
         LRmBOnknsqKO0/miEma3KtbiAIoLJlWmhBw3dFOYa+j9BXx86bHNf/xhD4pboE1YgAJC
         65AQTEyXt6zpwPdmKpO4jKg6MXW2W3GsAG0AJ/Iw9l02VF5fp9LP1L5t74fydUmXxy4Z
         Sw3F3lpIasWvIMyUizK8q10sSkdU4VzAzJINC7+ofRxuOWwf/esvDwT9qLLTS6LMvpHl
         Z9eg==
X-Gm-Message-State: AOJu0YxN5zh6gV0xZB1BYqNyTmIa1eUyHFLM2DWsw8ZRnmBKTeUhmzdE
	DFkpOmgXv3bql8uiGkZE7tAVNnuXUFjFrSk5baSvWUor3gH8mZ/xmkMNWdM7p2k=
X-Gm-Gg: ASbGncv1aSXFK9SLxcznMjfqgXwLH5vxEANVl8Ml5REea5xO8uXtA7HTKC3sp4Bq6fj
	S6er5FErRNtqth0G/9uiVLruAP8GR3NuIf6a8Mc8sf2LzClxO3oErMw0ik9dtztzSEgVYW2a1Ic
	hsLMqydpSVGRkKaCpjaT7IKod5lEVmwcZY4kAugpBK+GPbxyFH7KTOauZKSckHKRngQ98zDSSa8
	BIezB8y4Ifn3uurq2CsGB9aTQjeUC1tGEn5knP22ZW/4Ibk7wAXc54sIuKeUuESLsaR4zoH
X-Google-Smtp-Source: AGHT+IEBLZqoOYrW6nHUXJ7egvcj+Es2bL8Vmn9thwbGb2lLB155RAHbaFGiiw3uqE/wHQ/4XmtxzQ==
X-Received: by 2002:a05:6000:4b0e:b0:385:ef39:6ce3 with SMTP id ffacd0b85a97d-38875fc35f2mr2104047f8f.0.1734173402032;
        Sat, 14 Dec 2024 02:50:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8060848sm2209905f8f.106.2024.12.14.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 02:50:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: rogerq@kernel.org, tony@atomide.com, krzk@kernel.org, linux@treblig.org
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241211214227.107980-1-linux@treblig.org>
References: <20241211214227.107980-1-linux@treblig.org>
Subject: Re: [PATCH v2] memory: omap-gpmc: deadcode a pair of functions
Message-Id: <173417340096.24704.14642309670774788266.b4-ty@linaro.org>
Date: Sat, 14 Dec 2024 11:50:00 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 11 Dec 2024 21:42:27 +0000, linux@treblig.org wrote:
> gpmc_get_client_irq() last use was removed by
> commit ac28e47ccc3f ("ARM: OMAP2+: Remove legacy gpmc-nand.c")
> 
> gpmc_ticks_to_ns() last use was removed by
> commit 2514830b8b8c ("ARM: OMAP2+: Remove gpmc-onenand")
> 
> Remove them.
> 
> [...]

Applied, thanks!

[1/1] memory: omap-gpmc: deadcode a pair of functions
      https://git.kernel.org/krzk/linux-mem-ctrl/c/5119e6b44f8ada5f5cea19935a7f005fee062aef

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


