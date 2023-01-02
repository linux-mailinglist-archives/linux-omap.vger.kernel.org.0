Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FF265B27B
	for <lists+linux-omap@lfdr.de>; Mon,  2 Jan 2023 14:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbjABNE3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Jan 2023 08:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232634AbjABNE2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Jan 2023 08:04:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A622D2ADA;
        Mon,  2 Jan 2023 05:04:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F4F360F9C;
        Mon,  2 Jan 2023 13:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2AFC433EF;
        Mon,  2 Jan 2023 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672664666;
        bh=sbRpLyhH31BaFZ+7kx6V5iGug8vwNrbGgHuVkvcU5PQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lem0JlOIwW/TVJ1fPP5+HJRQGsD63se0DOmv0L635AUOqndB6dYC6xbefuInh7C0f
         xk59hfYNvlHXZ200ilgcxKRa4yEf78fc/Zt5hfTSs4GwPgNEjKKobEao817E6aui1e
         vZwQx6KfKltRj4UQb3eIfUGbt6PfS8uDg2w2WjeVHo0NsKbDFBFA8uZHoUjEoRVtnb
         KGIPtTcv/rYa2fmDKI3HmeVrxPsFX7gAKUQNo2UzNZ1P0ijY7zrIiBp1oZG5O2Te3E
         rW6sxgdzusV7G9z28HXue1Hsmg5VPJ3oTEd1CcVmEyRvlhsTJ99NV8zlTixv7haU7Y
         4ZFKQPw5zCn2Q==
Message-ID: <620ce8e6-2b40-1322-364a-0099a6e2af26@kernel.org>
Date:   Mon, 2 Jan 2023 15:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] dt-bindings: net: Add ICSSG Ethernet Driver
 bindings
Content-Language: en-US
To:     Andrew Lunn <andrew@lunn.ch>, MD Danish Anwar <danishanwar@ti.com>
Cc:     "Andrew F. Davis" <afd@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Suman Anna <s-anna@ti.com>, YueHaibing <yuehaibing@huawei.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>, nm@ti.com,
        ssantosh@kernel.org, srk@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221223110930.1337536-1-danishanwar@ti.com>
 <20221223110930.1337536-2-danishanwar@ti.com> <Y6W7FNzJEHYt6URg@lunn.ch>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <Y6W7FNzJEHYt6URg@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 23/12/2022 16:28, Andrew Lunn wrote:
>> +        ethernet-ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            pruss2_emac0: port@0 {
>> +                reg = <0>;
>> +                phy-handle = <&pruss2_eth0_phy>;
>> +                phy-mode = "rgmii-rxid";
> 
> That is unusual. Where are the TX delays coming from?

From the below property

+                ti,syscon-rgmii-delay = <&scm_conf 0x4120>;

The TX delay can be enabled/disabled from within the ICSSG block.

If this property exists and PHY mode is neither PHY_INTERFACE_MODE_RGMII_ID
nor PHY_INTERFACE_MODE_RGMII_TXID then the internal delay is enabled.

This logic is in prueth_config_rgmiidelay() function in the introduced driver.

> 
>      Andrew

cheers,
-roger
