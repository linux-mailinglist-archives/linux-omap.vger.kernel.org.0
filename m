Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F03A1757676
	for <lists+linux-omap@lfdr.de>; Tue, 18 Jul 2023 10:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjGRIXq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Jul 2023 04:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjGRIXp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Jul 2023 04:23:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7A610E
        for <linux-omap@vger.kernel.org>; Tue, 18 Jul 2023 01:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689668580;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6FSBtCXs/7shwlYmh01oM6RZ0wBWlZJwV+GjTL0rKho=;
        b=i2i8sMbumLJsy0RalV1Xua74PQRBPndtbQbJnbwiwgFHu7dqCj6KSa9iLGKDotdjYLxrzY
        pJNFpmg8ErPXQT9vrvkgQXSHSbyY+9MyNpxAxpdiZOtaHZ9f3dv2pS+ef1eBC3Mv3gvJBg
        KoNY+DCGSSPjY1OH2J8f6dMeYDdSa/Q=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-yA2T3q49OFag5_fL3c8epA-1; Tue, 18 Jul 2023 04:22:59 -0400
X-MC-Unique: yA2T3q49OFag5_fL3c8epA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-63c9463c116so5127266d6.0
        for <linux-omap@vger.kernel.org>; Tue, 18 Jul 2023 01:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689668579; x=1690273379;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6FSBtCXs/7shwlYmh01oM6RZ0wBWlZJwV+GjTL0rKho=;
        b=X1D7yw0ybncGTEtMsjcblj8NT4Etc0WJlhXCWRMJC5vY/ybZrTtJ6HtQ3LB/8YlXEK
         BEX6GgEeZU+yo33Dj/kz2q1QqOjz3zYliA84Bi4MUPMZ/6kwI3m8jpsIsZOSXQQh9s3p
         FBveHmB/VVfGEh6X6VXUJ8+LClPeWH1Y5MEnHRyCK7ftff+eH2Sj5UE9AYaXkHJOgM/d
         31ST5YNuZZj1QWRgyFg+Dl2qdY11Wjc8zj2vdup/u7Cq5yWdb1LTqa9ClGbn1XuyQe14
         3AJEIIU9xfcLcNBm/OnztpdQYoTRB5bGDIyuJTKW52Z8X3C8Y8GGfvbEzsnlGUZnzqVu
         ttCQ==
X-Gm-Message-State: ABy/qLbMLD3DF+/VQFWKTaJb6moIrSBT0GIugAbZW230V0fHHnVJEePP
        i+phbfQbFaU8nJTWzT3QQkpFZZ/1CFjBSkTDgxaOUVbszssrufRY7Hy5xQHMTW3XS4tofn3bl4X
        HaV81o/boWel+xg8ro/42sA==
X-Received: by 2002:a05:6214:519b:b0:635:d9d0:cccf with SMTP id kl27-20020a056214519b00b00635d9d0cccfmr15771457qvb.4.1689668579037;
        Tue, 18 Jul 2023 01:22:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEZij7j3C1mhYDyzb94baDSpKg9nU5+nrmzvpoo4McgxABPHMJTyxPFbG7HBtl7+7PIim3Hxg==
X-Received: by 2002:a05:6214:519b:b0:635:d9d0:cccf with SMTP id kl27-20020a056214519b00b00635d9d0cccfmr15771439qvb.4.1689668578718;
        Tue, 18 Jul 2023 01:22:58 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-226-170.dyn.eolo.it. [146.241.226.170])
        by smtp.gmail.com with ESMTPSA id om32-20020a0562143da000b0063631be090csm551258qvb.125.2023.07.18.01.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 01:22:58 -0700 (PDT)
Message-ID: <78b82c086c91be61d6a15582a7dc6f52b92f1b3e.camel@redhat.com>
Subject: Re: [PATCH v9 2/2] net: ti: icssg-prueth: Add ICSSG ethernet driver
From:   Paolo Abeni <pabeni@redhat.com>
To:     MD Danish Anwar <danishanwar@ti.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>
Cc:     nm@ti.com, srk@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Tue, 18 Jul 2023 10:22:53 +0200
In-Reply-To: <20230714094432.1834489-3-danishanwar@ti.com>
References: <20230714094432.1834489-1-danishanwar@ti.com>
         <20230714094432.1834489-3-danishanwar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 2023-07-14 at 15:14 +0530, MD Danish Anwar wrote:
> +static int prueth_netdev_init(struct prueth *prueth,
> +			      struct device_node *eth_node)
> +{
> +	int ret, num_tx_chn =3D PRUETH_MAX_TX_QUEUES;
> +	struct prueth_emac *emac;
> +	struct net_device *ndev;
> +	enum prueth_port port;
> +	enum prueth_mac mac;
> +
> +	port =3D prueth_node_port(eth_node);
> +	if (port =3D=3D PRUETH_PORT_INVALID)
> +		return -EINVAL;
> +
> +	mac =3D prueth_node_mac(eth_node);
> +	if (mac =3D=3D PRUETH_MAC_INVALID)
> +		return -EINVAL;
> +
> +	ndev =3D alloc_etherdev_mq(sizeof(*emac), num_tx_chn);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	emac =3D netdev_priv(ndev);
> +	prueth->emac[mac] =3D emac;
> +	emac->prueth =3D prueth;
> +	emac->ndev =3D ndev;
> +	emac->port_id =3D port;
> +	emac->cmd_wq =3D create_singlethread_workqueue("icssg_cmd_wq");
> +	if (!emac->cmd_wq) {
> +		ret =3D -ENOMEM;
> +		goto free_ndev;
> +	}
> +	INIT_WORK(&emac->rx_mode_work, emac_ndo_set_rx_mode_work);
> +
> +	ret =3D pruss_request_mem_region(prueth->pruss,
> +				       port =3D=3D PRUETH_PORT_MII0 ?
> +				       PRUSS_MEM_DRAM0 : PRUSS_MEM_DRAM1,
> +				       &emac->dram);
> +	if (ret) {
> +		dev_err(prueth->dev, "unable to get DRAM: %d\n", ret);
> +		ret =3D -ENOMEM;
> +		goto free_wq;
> +	}
> +
> +	emac->tx_ch_num =3D 1;
> +
> +	SET_NETDEV_DEV(ndev, prueth->dev);
> +	spin_lock_init(&emac->lock);
> +	mutex_init(&emac->cmd_lock);
> +
> +	emac->phy_node =3D of_parse_phandle(eth_node, "phy-handle", 0);
> +	if (!emac->phy_node && !of_phy_is_fixed_link(eth_node)) {
> +		dev_err(prueth->dev, "couldn't find phy-handle\n");
> +		ret =3D -ENODEV;
> +		goto free;
> +	} else if (of_phy_is_fixed_link(eth_node)) {
> +		ret =3D of_phy_register_fixed_link(eth_node);
> +		if (ret) {
> +			ret =3D dev_err_probe(prueth->dev, ret,
> +					    "failed to register fixed-link phy\n");
> +			goto free;
> +		}
> +
> +		emac->phy_node =3D eth_node;
> +	}
> +
> +	ret =3D of_get_phy_mode(eth_node, &emac->phy_if);
> +	if (ret) {
> +		dev_err(prueth->dev, "could not get phy-mode property\n");
> +		goto free;
> +	}
> +
> +	if (emac->phy_if !=3D PHY_INTERFACE_MODE_MII &&
> +	    !phy_interface_mode_is_rgmii(emac->phy_if)) {
> +		dev_err(prueth->dev, "PHY mode unsupported %s\n", phy_modes(emac->phy_=
if));
> +		ret =3D -EINVAL;
> +		goto free;
> +	}
> +
> +	/* AM65 SR2.0 has TX Internal delay always enabled by hardware
> +	 * and it is not possible to disable TX Internal delay. The below
> +	 * switch case block describes how we handle different phy modes
> +	 * based on hardware restriction.
> +	 */
> +	switch (emac->phy_if) {
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		emac->phy_if =3D PHY_INTERFACE_MODE_RGMII_RXID;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		emac->phy_if =3D PHY_INTERFACE_MODE_RGMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		dev_err(prueth->dev, "RGMII mode without TX delay is not supported");
> +		return -EINVAL;

At this point ndev prueth->emac[mac] =3D=3D emac, so the caller will try to
clean it up via prueth_netdev_exit(), which in turn expects the device
being fully initialized, while this is not. Notably the napi instance
has not being registered yet.

You should 'goto free;' above and possibly move the 'ndev prueth-
>emac[mac] =3D emac' assignment at the end of this function.

Thanks!

Paolo

