Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED64A343F7C
	for <lists+linux-omap@lfdr.de>; Mon, 22 Mar 2021 12:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhCVLUV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Mar 2021 07:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhCVLUK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Mar 2021 07:20:10 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7277CC061762
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 04:20:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q29so20518018lfb.4
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 04:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waldekranz-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=qI7goXjjGFeqHfifATUNUhUdn1BuomusuiEhucOhm2g=;
        b=qQ1l8VYivqDkzxJB3JRdAFBjzLic10uHyL/uUUFstkQ9ud2jIBdOHMURo/N30v5p3G
         4tsmcJFoI/2feqcwCikMhc9nmWqbs2V4Z5ByQbXSA4FGxdoNaKFoQxjoD4/BABefTXol
         Ju7lDesqUN9YEc7J0ZMXMN5fTvMmao+wJHvnJI1HEnUM+IRC7Wliy0/O83jTFmrNtGD9
         h1B2Ful/MXkj8CqbzbGHcwsYi1TE1ZzlwbLZMEo7W06ki68s/V7b7iGRzu+8wPoRndPm
         TPa9Mdki+FOnedg6gNAVgHDATWIPwg1nktRMUbuOsKzgFVx3PYvwV0OZXCPV72Hl/sXk
         0kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=qI7goXjjGFeqHfifATUNUhUdn1BuomusuiEhucOhm2g=;
        b=rBnkPXmnYPQ6ilXPRNYgDcZsyH1wHc+xHRvZnmvBL3SavQIPGMQtk4fp0Gz0l2d01Q
         DDB3xePUbpAJIazj53PIrRAjKBxbX8IWdgXoNPvZmqKEUNvbtD+t0yGvh2qta9au/4W5
         YOmKQjqD/iCWg0P2AIwSIb46+CuZxFkZAPE3pJ+oEal8lDTcJ92OVsu2kvFrGq0zoAMj
         CvjWHj/EL8rn/P/I/FNbjwpOwGRBJDWQerRHMEhpP5VJyogv/UEDTtkEHGf/F9I8bdrp
         CPI/UKie8GY0qFx8qVr5f+cH7lIEYo55WHUguG/DWIVYjeAqFwsamoGch+E6b4l1TqRQ
         7DuA==
X-Gm-Message-State: AOAM530mb8h3OJ8d2mBqgMgW0TC0dnY++xjI2bNTLu27lxe5YbLpSbP8
        bvFFZqXOwIJMkaCbTgB+MuzUHA==
X-Google-Smtp-Source: ABdhPJwA6JgdgFdF9FQMAXM2grOYAiw4AJkNivEq2/o2XmDjXIwu0iCVDbg6X5C8BWVB/ftnv++C+Q==
X-Received: by 2002:a19:4116:: with SMTP id o22mr8893165lfa.272.1616412007906;
        Mon, 22 Mar 2021 04:20:07 -0700 (PDT)
Received: from wkz-x280 (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
        by smtp.gmail.com with ESMTPSA id e15sm1539506lfs.83.2021.03.22.04.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 04:20:07 -0700 (PDT)
From:   Tobias Waldekranz <tobias@waldekranz.com>
To:     Vladimir Oltean <olteanv@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roopa Prabhu <roopa@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Ido Schimmel <idosch@idosch.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, Vadym Kochan <vkochan@marvell.com>,
        Taras Chornyi <tchornyi@marvell.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Ivan Vecera <ivecera@redhat.com>, linux-omap@vger.kernel.org,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [RFC PATCH v2 net-next 07/16] net: dsa: sync ageing time when joining the bridge
In-Reply-To: <20210318231829.3892920-8-olteanv@gmail.com>
References: <20210318231829.3892920-1-olteanv@gmail.com> <20210318231829.3892920-8-olteanv@gmail.com>
Date:   Mon, 22 Mar 2021 12:20:06 +0100
Message-ID: <87zgyvmo49.fsf@waldekranz.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Mar 19, 2021 at 01:18, Vladimir Oltean <olteanv@gmail.com> wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>
> The SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME attribute is only emitted from:
>
> sysfs/ioctl/netlink
> -> br_set_ageing_time
>    -> __set_ageing_time
>
> therefore not at bridge port creation time, so:
> (a) drivers had to hardcode the initial value for the address ageing time,
>     because they didn't get any notification
> (b) that hardcoded value can be out of sync, if the user changes the
>     ageing time before enslaving the port to the bridge
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---

Reviewed-by: Tobias Waldekranz <tobias@waldekranz.com>
