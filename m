Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC37563EFB2
	for <lists+linux-omap@lfdr.de>; Thu,  1 Dec 2022 12:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiLALmM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Dec 2022 06:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbiLALlv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Dec 2022 06:41:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D8798956
        for <linux-omap@vger.kernel.org>; Thu,  1 Dec 2022 03:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669894855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yW/cZ2Z5o6i4KxEquTb7/X2nGHQmwqZNw+btvVM7fIs=;
        b=d/NqZvua79qjZ8jmaoL7KGpQQLReuQbp9hGQ60HQeHTSsjJixWqxZetdg9l36NAQ7O2n5c
        0vkRRcTJH5/gp5XQHlyWQNvGaTDRP3RrMJTMMzWhQW2Sw1/WyZZm0WcNDO8SlwY4t7+aRb
        BI5nn7lq+o/pYeJKEESdBXn+ShqS7/g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-1W-dbMTFN0yaXvt_n_iFwg-1; Thu, 01 Dec 2022 06:40:54 -0500
X-MC-Unique: 1W-dbMTFN0yaXvt_n_iFwg-1
Received: by mail-wm1-f70.google.com with SMTP id l42-20020a05600c1d2a00b003cf8e70c1ecso2428956wms.4
        for <linux-omap@vger.kernel.org>; Thu, 01 Dec 2022 03:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yW/cZ2Z5o6i4KxEquTb7/X2nGHQmwqZNw+btvVM7fIs=;
        b=Oi6lW6xi5ljNA1mwA3q/vEV9l69l34R1bfFCxKmNr6GeJM58wu9arBqO8oGUmwHxx9
         ziJ3W0K7Z1acdf1AVz2/ge2dMFa8dE9xgChe+dQidw1V+Oc4rvr6jAiQQBPgIRV2Irz1
         Bg55kxYu+qWBxlFEp4S/rDUO7XNA/NSz3B+eZCAH9sGSls2xe+kyJ/xoFquVf3ZxY8Lt
         1bo9p7vc9W42c3GSYlVA3S0G8gaNZFx7mm8GecSh1IJNYBRTs177nGxXRWoLp7hDYP9L
         tQHBNckq9ZR5fFSHADl1llzrZMr3J5VoleWIZQWMxyrqeh2eJ/mmqHf4cmXnO0qZnORF
         A2Ww==
X-Gm-Message-State: ANoB5plnH96yauzzHDxPanttvNgnvR3tioZI4K+uyKwlSdpSPAbNvZgJ
        ZX3+XNfdVdbT7/YjkZ0OlwhY93vkpaV+oXPI6DLH80Okj9d2kOXt4wg5DAwbY7ZFIaMHEXvtfLv
        4k4guNaXorHcVcN4WANEX4Q==
X-Received: by 2002:a05:600c:aca:b0:3c6:6f2c:64ef with SMTP id c10-20020a05600c0aca00b003c66f2c64efmr41468666wmr.91.1669894853534;
        Thu, 01 Dec 2022 03:40:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7KYx7l14jHtR36fJ0R07i3GNEthiTcJzcmBeHhKJjQrq0ypw62l+DxXKeXhWGqqRMPx2xXfg==
X-Received: by 2002:a05:600c:aca:b0:3c6:6f2c:64ef with SMTP id c10-20020a05600c0aca00b003c66f2c64efmr41468651wmr.91.1669894853321;
        Thu, 01 Dec 2022 03:40:53 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-203.dyn.eolo.it. [146.241.120.203])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b435c41103sm11182535wmo.0.2022.12.01.03.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 03:40:52 -0800 (PST)
Message-ID: <9fdc4e0eee7ead18c119b6bc3e93f7f73d2980cd.camel@redhat.com>
Subject: Re: [PATCH v4 net-next 4/6] net: ethernet: ti: am65-cpsw: Add
 suspend/resume support
From:   Paolo Abeni <pabeni@redhat.com>
To:     Roger Quadros <rogerq@kernel.org>, davem@davemloft.net,
        maciej.fijalkowski@intel.com, kuba@kernel.org
Cc:     andrew@lunn.ch, edumazet@google.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 01 Dec 2022 12:40:51 +0100
In-Reply-To: <20221129133501.30659-5-rogerq@kernel.org>
References: <20221129133501.30659-1-rogerq@kernel.org>
         <20221129133501.30659-5-rogerq@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 2022-11-29 at 15:34 +0200, Roger Quadros wrote:
> @@ -555,11 +556,26 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
>  	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
>  	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
>  	int ret, i;
> +	u32 reg;
>  
>  	ret = pm_runtime_resume_and_get(common->dev);
>  	if (ret < 0)
>  		return ret;
>  
> +	/* Idle MAC port */
> +	cpsw_sl_ctl_set(port->slave.mac_sl, CPSW_SL_CTL_CMD_IDLE);
> +	cpsw_sl_wait_for_idle(port->slave.mac_sl, 100);
> +	cpsw_sl_ctl_reset(port->slave.mac_sl);
> +
> +	/* soft reset MAC */
> +	cpsw_sl_reg_write(port->slave.mac_sl, CPSW_SL_SOFT_RESET, 1);
> +	mdelay(1);
> +	reg = cpsw_sl_reg_read(port->slave.mac_sl, CPSW_SL_SOFT_RESET);
> +	if (reg) {
> +		dev_err(common->dev, "soft RESET didn't complete\n");

I *think* Andrew was asking for dev_dbg() here, but let's see what he
has to say :)

Cheers,

Paolo

