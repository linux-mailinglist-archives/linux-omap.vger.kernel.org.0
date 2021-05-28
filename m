Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FD6394344
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 15:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbhE1NNp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 09:13:45 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:54252 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234486AbhE1NNo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 May 2021 09:13:44 -0400
X-Greylist: delayed 992 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 May 2021 09:13:42 EDT
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1lmc1R-000691-6Y; Fri, 28 May 2021 15:55:29 +0300
Subject: Re: [PATCH -next] ASoC: ti: omap-mcbsp: use DEVICE_ATTR_RW macro
To:     YueHaibing <yuehaibing@huawei.com>, peter.ujfalusi@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc:     alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210528063033.19904-1-yuehaibing@huawei.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <4e8da5c2-9a9e-c0a9-f944-8e0e9f30f47e@bitmer.com>
Date:   Fri, 28 May 2021 15:55:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210528063033.19904-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/28/21 9:30 AM, YueHaibing wrote:
> Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/ti/omap-mcbsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
