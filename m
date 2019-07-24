Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14489724B8
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 04:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfGXCeP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 22:34:15 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36387 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfGXCeO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Jul 2019 22:34:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so20376272pgm.3;
        Tue, 23 Jul 2019 19:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zLRKL/gPs+H8SY77w9eVBrRyeHltVjkGP2Avoqt8jdk=;
        b=A1c4BoDRmx0ORVvKKiL72V4Q6T65Dly7SwVr7+L8Z8PoVqhMCd5V+h3oDgzqhF0xlS
         ZlJ7J9Vbr41LsJCV46TKMxMdiUav5iiRAbeEW/goapwL0PE8/kp5UbsQvCBCFPT9AORV
         ICxXCjOC7KafO89PTQnfamcfZyvnOoOzc5Vk4qJApDpd/DZ7jt0f1yv5HmyrBnRAvxbg
         9WcDNJcPQlLP1RXjnZv75dsEtr8g2WFQW8t2lkASc9U59F5Iy2iO0w06QmL0AUt8Ld5l
         gkr5ubVzpi9i9wOrQlgbqdhZY7wz4td7IbR3XYK+nSJEdjyTBIdz88jnWffHhRwNeibw
         GcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zLRKL/gPs+H8SY77w9eVBrRyeHltVjkGP2Avoqt8jdk=;
        b=OTJt7pqUw+4qxm8fCFdeIOwWJWlSCn9vR3YdtDOJv5rA3myV+iS3AqXsqXCwrX4bpF
         yZ0w1myAgfu+3IRH2oujhwgy0tIf5Vvn3TYDCnVmeWV19l1d9BLNsB+TerI3jJqEpa1F
         K3C+NNXMvCqCPEDLwCVCfcg9FK4nXeDoGM2iZE4vBgU5OstIGwpQekrkLtaHqIrulgT9
         BK5M3moFgPMByIExEN67N2jP0TRGEB7GT/KR2wM10mvTgo4qEMgGxpH4YqnF6g+C2qYM
         ONngGNkTSruunPLmJvZPIKRXMvxtjsWPfE0Rk4CRENBTldFvHeXlS9uFtWdh7sMWg9dQ
         5TLg==
X-Gm-Message-State: APjAAAWVV27wd62xMnnwVAha2ychwlpPx/DOSJFvad6NmEC6xtTbXSY6
        LuLRpNqiG20Y1HSC6CTonfM=
X-Google-Smtp-Source: APXvYqzfA83c3TncrVOHNCO4gafJ0pOTxGRqj3ih5x1kS51UKLt8voYTdn970u/vx83IkL0x3MjUow==
X-Received: by 2002:a63:5a4d:: with SMTP id k13mr76810401pgm.174.1563935654132;
        Tue, 23 Jul 2019 19:34:14 -0700 (PDT)
Received: from [192.168.1.5] ([110.78.179.210])
        by smtp.googlemail.com with ESMTPSA id s66sm48054058pfs.8.2019.07.23.19.34.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 19:34:13 -0700 (PDT)
Subject: Re: [PATCH] USB: serial: option: Add Motorola modem UARTs
To:     Tony Lindgren <tony@atomide.com>, Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>,
        Dan Williams <dan.j.williams@intel.com>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
References: <20190723144956.55753-1-tony@atomide.com>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <75e9bccc-d76d-2bc6-f9f3-a0efc25e8238@gmail.com>
Date:   Wed, 24 Jul 2019 09:34:09 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723144956.55753-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/23/2019 21:49, Tony Lindgren wrote:

> +#define MOTOROLA_VENDOR_ID			0x22b8
> +#define MOTOROLA_PRODUCT_MDM6600		0x2a70
> +#define MOTOROLA_PRODUCT_MDM9600		0x2e0a
> +#define MOTOROLA_PRODUCT_MDM_RAM_DL		0x4281
> +#define MOTOROLA_PRODUCT_MDM_QC_DL		0x900e
> +

Johan, when he is back from vacation, will tell you to drop those 
defines and instead use the values directly in the list with a comment 
behind reflecting the device model.
Just telling you so you can save time by sending out your v2 early..


best rgds
/Lars
