Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65B641987F
	for <lists+linux-omap@lfdr.de>; Mon, 27 Sep 2021 18:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbhI0QIt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Sep 2021 12:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235381AbhI0QIs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Sep 2021 12:08:48 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F62C061714
        for <linux-omap@vger.kernel.org>; Mon, 27 Sep 2021 09:07:10 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id s16so16365048pfk.0
        for <linux-omap@vger.kernel.org>; Mon, 27 Sep 2021 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XTLDjg6tKpXO0n3tGXRecJAHRamIK6iZPCPoGCwwYoA=;
        b=n+WFlH5sDsKJBIqbhXBL0q86YID/cm95Hb4Pn7OgXho2+PQI0nSIdRbWypwC1UKBDc
         DLGkfkLNRgU/4Jp5PtjVk8wlNcPXFV82TekHIAWzakfClYLV1up37fwMMsaFds99YrVu
         hNhlWvvXJ7s5t7jexJWYFgrPnilemlVeEY6QOZlKBD8momja0/KMxsagYQWYBX3Swb0R
         IBff6ti5Yo9g23SYXpecR6u2VLeocqeAEBuEh7d2TS0npVBk3zwvJ6xEwnVe9dM1BC3A
         QwKM/wGB/13xUZ8eKf1kP0LtQtr2a4f5cOQEzBeZGmRFBfWO/kxwb9qc8cB5gj0PVpiy
         36Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XTLDjg6tKpXO0n3tGXRecJAHRamIK6iZPCPoGCwwYoA=;
        b=bX7V6teYWjkpmb8D8wD1bHqrB2TGszyZIcsihp5NENQLC6hN2rkF1sqlCpAbf/H8K3
         gCYZ1kWEVZXWLAj+pu3Pgp7QMDMIyy232l4fhPkJ7puFM3z9TDNEd4JipfAD2Kbumq0H
         DSDYALVaI47083+4BtBKyyNLvieFHMt/UxJTE9UOMACZmLjEMZUlYF7kEbAUNeRbpApT
         +xy3FUMACZuGIneiCyre6s/nJy5tAxM/jymMc8XTuRiEgoWIerr11PqQBwkYNGzIwXZh
         FjFWkhBY6kmwlBIK/MgNLTPwpE/k/U5tdGGBbpfRE9Tooxn3WWo6ZkUQuQSpne8m5IVT
         og8g==
X-Gm-Message-State: AOAM532QYWBW9ZI7uF5Kmzcl5UQV0XfkjKzM9Gliee+z2UixPYcAgipT
        ptoDNyONQOjaJmmX8JgSh9pTNw==
X-Google-Smtp-Source: ABdhPJwR7BDUtOf/PI25/vpcHZm+mNUz7FflOv5PSidwcLqI4zYdDEmizFXZbBjNUgQkz/U1dIeC3A==
X-Received: by 2002:aa7:94aa:0:b0:43e:2cf:d326 with SMTP id a10-20020aa794aa000000b0043e02cfd326mr447025pfl.62.1632758829714;
        Mon, 27 Sep 2021 09:07:09 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local ([50.53.47.17])
        by smtp.gmail.com with ESMTPSA id 77sm17358967pfu.219.2021.09.27.09.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 09:07:09 -0700 (PDT)
Subject: Re: [PATCH net-next v1 14/21] ionic: Move devlink registration to be
 last devlink command
To:     Leon Romanovsky <leon@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Leon Romanovsky <leonro@nvidia.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Ariel Elior <aelior@marvell.com>,
        Bin Luo <luobin9@huawei.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Derek Chickles <dchickles@marvell.com>, drivers@pensando.io,
        Felix Manlunas <fmanlunas@marvell.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Geetha sowjanya <gakula@marvell.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        hariprasad <hkelam@marvell.com>,
        Ido Schimmel <idosch@nvidia.com>,
        Intel Corporation <linuxwwan@intel.com>,
        intel-wired-lan@lists.osuosl.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Jerin Jacob <jerinj@marvell.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Jiri Pirko <jiri@nvidia.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Linu Cherian <lcherian@marvell.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
        Loic Poulain <loic.poulain@linaro.org>,
        Manish Chopra <manishc@marvell.com>,
        M Chetan Kumar <m.chetan.kumar@intel.com>,
        Michael Chan <michael.chan@broadcom.com>,
        Michael Guralnik <michaelgur@mellanox.com>,
        netdev@vger.kernel.org, oss-drivers@corigine.com,
        Richard Cochran <richardcochran@gmail.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Satanand Burla <sburla@marvell.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Simon Horman <simon.horman@corigine.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Sunil Goutham <sgoutham@marvell.com>,
        Taras Chornyi <tchornyi@marvell.com>,
        Tariq Toukan <tariqt@nvidia.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        UNGLinuxDriver@microchip.com, Vadym Kochan <vkochan@marvell.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
References: <cover.1632565508.git.leonro@nvidia.com>
 <cb187a035b75dbcc27f6dd10d72f18f1101bad44.1632565508.git.leonro@nvidia.com>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <f1d3e167-a991-13cb-d263-6466110fa8c4@pensando.io>
Date:   Mon, 27 Sep 2021 09:07:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cb187a035b75dbcc27f6dd10d72f18f1101bad44.1632565508.git.leonro@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/25/21 4:22 AM, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>
> This change prevents from users to access device before devlink is
> fully configured.
>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Thanks for the work,

Acked-by: Shannon Nelson <snelson@pensando.io>


> ---
>   drivers/net/ethernet/pensando/ionic/ionic_devlink.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_devlink.c b/drivers/net/ethernet/pensando/ionic/ionic_devlink.c
> index 93282394d332..2267da95640b 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_devlink.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_devlink.c
> @@ -82,7 +82,6 @@ int ionic_devlink_register(struct ionic *ionic)
>   	struct devlink_port_attrs attrs = {};
>   	int err;
>   
> -	devlink_register(dl);
>   	attrs.flavour = DEVLINK_PORT_FLAVOUR_PHYSICAL;
>   	devlink_port_attrs_set(&ionic->dl_port, &attrs);
>   	err = devlink_port_register(dl, &ionic->dl_port, 0);
> @@ -93,6 +92,7 @@ int ionic_devlink_register(struct ionic *ionic)
>   	}
>   
>   	devlink_port_type_eth_set(&ionic->dl_port, ionic->lif->netdev);
> +	devlink_register(dl);
>   	return 0;
>   }
>   
> @@ -100,6 +100,6 @@ void ionic_devlink_unregister(struct ionic *ionic)
>   {
>   	struct devlink *dl = priv_to_devlink(ionic);
>   
> -	devlink_port_unregister(&ionic->dl_port);
>   	devlink_unregister(dl);
> +	devlink_port_unregister(&ionic->dl_port);
>   }

