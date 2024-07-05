Return-Path: <linux-omap+bounces-1731-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4792817C
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 07:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E8931C22075
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 05:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9DB4CB28;
	Fri,  5 Jul 2024 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCGEe5FQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59827224F2;
	Fri,  5 Jul 2024 05:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158431; cv=none; b=k7Z8WdvvXCN/gQEVkGdYwZB5gMt5ch/jGoMmc7K4Uk2p78jR5MKC+vyz9DKS4qT/gUq6Pdp8UD1RRT93pQJONuEva6qT1O1iv05poYx0OaXhpen2shwTJW/ICgA2I7I3nTs8X2AUWH4W22hqvolNjWkhgRmw5IZJ9plubnN+D9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158431; c=relaxed/simple;
	bh=dG6ZMs8GKA1J4eYx/XekQpH1Qlq8VEqAMdF2BpfTFZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGQ7eYtF1I3IE0WWZtY0sj6Sz2U4z/UzKkbK/3F0TPbksY03AtHrmxV8DOS0njRYTPypfszYq2Vm7kLK9svZa58c+dun6H0Utsc2hJSEdBH7z3+7yPH8F6E9LAlcJL02t1qlLyieuSlyZoDsg3LKMld6yHI6d+1SsypMQGk4mNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCGEe5FQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so48408e87.0;
        Thu, 04 Jul 2024 22:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720158427; x=1720763227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=krCoQNWgWkCVZVoxoVGgCyGHNoVnIgHcNNfQdbjzvpY=;
        b=HCGEe5FQaT2FZAzS/UkUPoM9F/fsUjeFNKhWeTSYvzKxUJfv4mNOWA4XbXNGmQuKtW
         wItfTzP8sBJa//20nr51Jl8shcucfFtBdkFLzTyZNWv6ZIfPYikq9MMxvb82ut29Pwpv
         gzDFenb1JlfgZ879f7k9iJDSf2wG8zxqz4zdaytrvzdeDhtV+kepMLDeBr3M4lRPyjxJ
         F4NO7npyfKbzK5OjQKCBYa5nmrELBULfV84gpbMI9Ki/IiejVI6C+M989iQuaxlu50vT
         kmSbVolNWPox730EpTQ6heTacNatlczG6P+OXvg9TFch8s7xFi+F8BPwkyZ1FCig2GPt
         ZW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720158427; x=1720763227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krCoQNWgWkCVZVoxoVGgCyGHNoVnIgHcNNfQdbjzvpY=;
        b=fFjawCJvcH9k2FpOZyBBs3S8boFbPPIQcvYl+zue78BDISgB9+gNGw0nKSRR6iy5D3
         E1L8EFnkjVG6ssViskIiWhn0KVATD/nQPxJGngO2EJMQ++oHCAx0XYtgwoPliCe0byaJ
         wpPRN9QFM072OIHsEWhKqzbxQ6wUMFbTX0EFAm1yRuJ+sI84RfN4f4M2FztTnYQOpwqe
         azW4fP07kBTEvXhruN700TAk5WrCalDM5UqrxtJGu1Y5R5/jEM7mrkTvOrYLMFaaw7T8
         Ae0S1wJeKdOBwW8Tffzw202HlhMvYIP23EoRmblx/Lvu/M0QwComB//RHsgqyN5zEX7s
         oeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH8agXDIixm6PnGDxLXELuBDoGHYcoQ1s+8yg130bDRHJvSaauoe1Ye1ZTHtnMBsIWXyZ8vH20kBfR0BVvbfUuVF+jfowUor3nYWhrlN23Q0E742RVZtVW575oWFxfRjEcLJ/pMblOO7HwbLPV
X-Gm-Message-State: AOJu0YzLgLGp4sRa7lJnyKwRXb356mr03LnPvQAHu1qSb1ySaTJyFXnj
	QYSvRcapXvM6yQwqfiyZPzTxTAWaNsVI5AXUJYSxiEfDHCIvqS+M
X-Google-Smtp-Source: AGHT+IE0GNtMf6UPdNr/wI7vJffg6XXW+NaZoazh2xsk3bgg+N44sIBTRgrRFUK3BkppBbWWLLfcqQ==
X-Received: by 2002:ac2:4e8c:0:b0:52e:9b9f:9377 with SMTP id 2adb3069b0e04-52ea062a94dmr2196831e87.21.1720158426713;
        Thu, 04 Jul 2024 22:47:06 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ea378eaa7sm220262e87.300.2024.07.04.22.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 22:47:06 -0700 (PDT)
Message-ID: <3a90ebea-e0b1-47d9-8fff-cf75429b2696@gmail.com>
Date: Fri, 5 Jul 2024 08:47:04 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] mfd: rohm-bd71828: Constify read-only regmap
 structs
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
 <20240704-mfd-const-regmap_config-v2-13-0c8785b1331d@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-13-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/24 20:23, Javier Carrasco wrote:
> The regmap_irq and regmap_irq_chip structs are not modified and can be
> declared as const to move their data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


