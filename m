Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B1B343DE7
	for <lists+linux-omap@lfdr.de>; Mon, 22 Mar 2021 11:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhCVKbC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Mar 2021 06:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhCVKaj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Mar 2021 06:30:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61D6C061574
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 03:30:38 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s17so20359900ljc.5
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waldekranz-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=vH00uR+Pe4HYWYMeGZhArjlmDDVkarNdGvE7yN7mQOY=;
        b=NoOx5xM1abbf+jDT9TEIbWhgmjeAUA8tMLNziM+RisYQt8/mMCnwM+qu5IKkSNBJBd
         uo1GOIIm+3OMCgLy4J02iP7WarjE0KoG6jLgig8w9lpAR20V1wDHKGu0oeHT82LNsaaW
         u2sfgsd8P1b2ppwm1bPZej41be6xvhr+AjDokjfg0o5kvisAVw9QI5ZNKbd6W+DHAgMy
         con/dNK4konzV/YmyF7oHv5ARVw9686G/8cCOsJETzD1d5nDshsA8ZTBeqtXUSUmc2++
         4TFGmBQlejwottqX38uGE3INqTcCeC9NfGVMW9d0TU5g3ThwlKzzvWSku7ZWROtzqmO9
         dE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=vH00uR+Pe4HYWYMeGZhArjlmDDVkarNdGvE7yN7mQOY=;
        b=aYa0YQzWRtp3iSmG3Jn7HzGfFyDD8NLG8Uf6D48a6EKkLb2MkL1RUiguLtojCxzQow
         b8UJmfki5wMc99zJQBqQHlC5wgQp6r5FsUEpIiYPI7daXs2DKPiioEamRa8qCtMkhz+m
         Sxt3HVI0G+fXad/JdrjSZR9sT/nQhBc5FXyWwaNhKm4IhwT7mj5/oPpHytQSihIURB/O
         7bEVikSstTfGAbc+yX0MFX3bmZqoN0hA4gkGQN/zYAqUr6AkI6hOCLjBVfASaXOWt5jv
         rcd4Zkz36WorUVeAAZzNUd+yN0XNGiW52NDLq/zlldhSs04Q7laAUigG9TwtK129KfXZ
         SraQ==
X-Gm-Message-State: AOAM530TSLliYWnzizUXc/ugn07CNY6tCFWmtqEjrAyveLEGdtHmYrHL
        LVnAjIti90iwIAKI0iMpZ0WTBQ==
X-Google-Smtp-Source: ABdhPJxHH9IHSYR9l3d20OvD+4KVDNxWnqZuuI7VmRnTI99Pjo9XfEhsAgRXFNqA6d/Lj+0DNXIqUg==
X-Received: by 2002:a2e:88ca:: with SMTP id a10mr9094329ljk.55.1616409037330;
        Mon, 22 Mar 2021 03:30:37 -0700 (PDT)
Received: from wkz-x280 (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
        by smtp.gmail.com with ESMTPSA id e8sm1888744ljg.22.2021.03.22.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 03:30:36 -0700 (PDT)
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
Subject: Re: [RFC PATCH v2 net-next 05/16] net: dsa: sync up VLAN filtering state when joining the bridge
In-Reply-To: <20210318231829.3892920-6-olteanv@gmail.com>
References: <20210318231829.3892920-1-olteanv@gmail.com> <20210318231829.3892920-6-olteanv@gmail.com>
Date:   Mon, 22 Mar 2021 11:30:36 +0100
Message-ID: <875z1jo4z7.fsf@waldekranz.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Mar 19, 2021 at 01:18, Vladimir Oltean <olteanv@gmail.com> wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>
> This is the same situation as for other switchdev port attributes: if we
> join an already-created bridge port, such as a bond master interface,
> then we can miss the initial switchdev notification emitted by the
> bridge for this port.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---

Reviewed-by: Tobias Waldekranz <tobias@waldekranz.com>
