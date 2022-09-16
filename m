Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80C925BA8B4
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 10:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiIPIza (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 04:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiIPIzK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 04:55:10 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B94A7C31F
        for <linux-omap@vger.kernel.org>; Fri, 16 Sep 2022 01:55:07 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so4901844wmq.1
        for <linux-omap@vger.kernel.org>; Fri, 16 Sep 2022 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=rNGRuhXrO5kfnSLP4dJYEpgK9T6BstMP5JJpz1PYQu0=;
        b=HtocsGFhvlU+BP0zOYbMJsVVWQPSjO5EN6bXlH61Erc5X8TLsiKZexdLg4MAf4at/C
         2ucVyxy6DdlfhCc/S1G3j1VIGsTtTJjy0QNmk+GIbCWNWuiJqlVOGUkSM9nUEBMARMmG
         Ur3Gg5DFPcwi/+GFLkt6xwQbUCAhNFEU6LvTybfhrb2jfvpEz4KLQsC1cpXUXubcnI+h
         EmwuIXmzTiA+mMgXrt4LDpMS/O6XckZJ2/qP2pZvQjLo2Lt0W2NJ+w6S7+Nfj9oSgCu2
         wmBZFUYqcc7Nc6rSbpN3rXEP6bYgYIAvPxm3b4qYNvkDtsOUx2yfBxkP82lA4Vvx6B2S
         SaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=rNGRuhXrO5kfnSLP4dJYEpgK9T6BstMP5JJpz1PYQu0=;
        b=P196+jFIbd9JkNifUKUi1we63IEbVpo+AMAT6Eh7DM8m+UUA5dYcdh+UzSJ4HjVzGu
         yEPLnQ1Qu4hHhuaNoI+g05b15+pwSoG6SeyKuMgZATXtRLyaGqiORSyN9L0iYtiMpx5J
         1dn6dm9IF276eEsfGcJfTuYuC++uNA1BJKqzphIacqlaPP6KjkyL7Gv9RRgeEIWVzKFp
         1xeRvhcLH6TeHY6a4b9J7AeZ9u2IXdiUZnRTs1cmcXsfDNB2PO1tjIPFX6jjD6a3G5Sk
         xeELDWSY+pBCtQP03G+JdVeIpE+sGjbz86+kliTBWrI+14LVBTjWruef/vNOQ9m6YfI9
         8c6g==
X-Gm-Message-State: ACrzQf04WfNOBTe3k6nOgqsFNk/Bklp2ny/A6Sdb5vByc9SgHfRJEJ3L
        N7xnRRqVc4BEP8JMAmZAZ7adX23YcwOchg==
X-Google-Smtp-Source: AMsMyM63+NyXQmoJ/qSKrdH1E67jUX32Q+CW08Oa/XHBtZSbOG3Ib9MtgxuXbPgU2jTwnKM0uf78Ng==
X-Received: by 2002:a05:600c:4ec8:b0:3b4:bdc6:9b3d with SMTP id g8-20020a05600c4ec800b003b4bdc69b3dmr1254364wmq.181.1663318505541;
        Fri, 16 Sep 2022 01:55:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id q126-20020a1c4384000000b003b4bd18a23bsm1294084wma.12.2022.09.16.01.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 01:55:05 -0700 (PDT)
Message-ID: <9aced000-5e66-50b9-1e1b-28ff96871d42@smile.fr>
Date:   Fri, 16 Sep 2022 10:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org >> Roger Quadros" <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Md Danish Anwar <danishanwar@ti.com>
From:   Romain Naour <romain.naour@smile.fr>
Subject: prueth: IEP driver doesn't probe anymore
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

I'm able to use the prueth driver on a AM5749 cpu using the TI vendor branch
(ti-linux-5.10.y). But I need a more recent kernel to support other device on my
custom board. So I had to rebase all the TI work related to the out of tree
prueth driver on a the latest kernel.

I hope this driver will be merged in the kernel soon but the series [1] doesn't
include the prueth driver for AM57xx cpus (only the icssg_prueth for AM65xx is
included).

For some reason the IEP driver [2] [3] doesn't probe anymore. Is a side effect
of recent ti-sysc or legacy platform data work ? I'm using a 5.19.8 stable kernel.

The prueth_probe() error out with "unable to get IEP" log message.

Do you have any clue?

Danish, if you can provide a new version of the "PRUSS Remoteproc, Platform
APIS, and Ethernet Driver" series including the prueth and iep driver for
AM57xx, I will be able to test it [4].

Thanks!

[1] https://lore.kernel.org/netdev/20220406094358.7895-1-p-mohan@ti.com/
[2]
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=d3bf5a58c356a90fe14d34f213d6195b9a946dc5
[3]
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=7cb095866c8b436176dd783878a9e9c3c0bada0b
[4]
https://lore.kernel.org/linux-remoteproc/992019ad-5c58-d420-8a18-a82228f8e086@smile.fr/

Best regards,
Romain
