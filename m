Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E7910C615
	for <lists+linux-omap@lfdr.de>; Thu, 28 Nov 2019 10:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfK1JiL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Nov 2019 04:38:11 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50637 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfK1JiK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Nov 2019 04:38:10 -0500
Received: by mail-wm1-f67.google.com with SMTP id l17so10249792wmh.0
        for <linux-omap@vger.kernel.org>; Thu, 28 Nov 2019 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NhpLhJz6+GDF9m5U6zWuGMsno9FtNQ2w1q9YdXHXl14=;
        b=osNXp1PoN1pNhtrxYjY6DcE8SZhJaS2KskPEeSN8ztSvahvxN4BpUC+7LeDoz9PO8Z
         I0gzYdxQfGjXIb6/Z67XNwX3QDLs3Bz/j0HpJ5RwuZYlymTwqf7Sja4a+Shhg+fzbAjb
         Mg3ztcaeZsf6itIt3xHy9QPDOkbR4/u+TceDQjSv2SQyMK1k5TBdBaoIekpL35fkBKtR
         UdlcWvz4JdBQIl0U6bY46pQ2nL8qHBKyKKqeOCFBpL6v2l/n6WxtfAr8VdtFE8/esimq
         Yu0xg8AOreQ1svph/X3j3/tDkjyh4QuCeAvYcfu+4YgAVJMnwa5ZCT9FJ3WFW2Z2FJXJ
         SGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NhpLhJz6+GDF9m5U6zWuGMsno9FtNQ2w1q9YdXHXl14=;
        b=OC9NIUhEBBf1G365uUPhQRHPGyDSEXWb0OOP+PGM+NtxsBz/BKGYwmlDOAoaesTwql
         hiy2bMURKtrCNHE+WmsghR/CRZLzHNSDREILZ5aR/V7ePueEC7HM34qnZCYyK7q3VcpU
         dx69rKMX+INKq4RG/f/0STos79soUnTMCOr7T1wEKhano4IEKkMYeXVkpwRp4bz8Dncl
         biaDuCDC1yDRtpZQcQuLN8hW27GJfkvzxaUAy4WlrwzqUnTbhJQaiow+4saj08psNbiV
         dL5AG8wpexZBtJri6Xdg7XItJowkoCyWc2RjCWq5E0PcE8gxPrteGNE4RgEUeHPQ7dE5
         H5Mw==
X-Gm-Message-State: APjAAAXyPbt9YML0h5SYin1rCNr8vVuPulREuMpioTr4d7jUqqL07d5v
        NSIr+3ORAX8906x7JugBNY/QUw==
X-Google-Smtp-Source: APXvYqxshxI1xLIjiArznE4nEZ0G3ax1Vs9ZBK7qgqy3CJVywQrE7TmI2c+oBXwRmIS83w6jJ6LDtA==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr8563703wmi.141.1574933887456;
        Thu, 28 Nov 2019 01:38:07 -0800 (PST)
Received: from apalos.home (athedsl-4476713.home.otenet.gr. [94.71.27.49])
        by smtp.gmail.com with ESMTPSA id f2sm3076753wmh.46.2019.11.28.01.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 01:38:06 -0800 (PST)
Date:   Thu, 28 Nov 2019 11:38:04 +0200
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>, Sekhar Nori <nsekhar@ti.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: ti: ale: ensure vlan/mdb deleted when no
 members
Message-ID: <20191128093804.GA18633@apalos.home>
References: <20191127155905.22921-1-grygorii.strashko@ti.com>
 <20191128082127.GA16359@apalos.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128082127.GA16359@apalos.home>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Nov 28, 2019 at 10:21:27AM +0200, Ilias Apalodimas wrote:
> On Wed, Nov 27, 2019 at 05:59:05PM +0200, Grygorii Strashko wrote:
> > The recently updated ALE APIs cpsw_ale_del_mcast() and
> > cpsw_ale_del_vlan_modify() have an issue and will not delete ALE entry even
> > if VLAN/mcast group has no more members. Hence fix it here and delete ALE
> > entry if !port_mask.
> > 
> > The issue affected only new cpsw switchdev driver.
> > 
> > Fixes: e85c14370783 ("net: ethernet: ti: ale: modify vlan/mdb api for switchdev")
> > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > ---
> >  drivers/net/ethernet/ti/cpsw_ale.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> > index 929f3d3354e3..a5179ecfea05 100644
> > --- a/drivers/net/ethernet/ti/cpsw_ale.c
> > +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> > @@ -396,12 +396,14 @@ int cpsw_ale_del_mcast(struct cpsw_ale *ale, const u8 *addr, int port_mask,
> >  	if (port_mask) {
> >  		mcast_members = cpsw_ale_get_port_mask(ale_entry,
> >  						       ale->port_mask_bits);
> > -		mcast_members &= ~port_mask;
> > -		cpsw_ale_set_port_mask(ale_entry, mcast_members,
> > +		port_mask = mcast_members & ~port_mask;
> > +	}
> > +
> > +	if (port_mask)
> > +		cpsw_ale_set_port_mask(ale_entry, port_mask,
> >  				       ale->port_mask_bits);
> > -	} else {
> > +	else
> >  		cpsw_ale_set_entry_type(ale_entry, ALE_TYPE_FREE);
> > -	}
> 
> The code assumed calls cpsw_ale_del_mcast() should have a port mask '0' when
> deleting an entry. Do we want to have 'dual' functionality on it? 
> This will delete mcast entries if port mask is 0 or port mask matches exactly
> what's configured right?
> 

Deleting the ALE entry if the port_mask matches execlty what's configured makes
sense. Can we change it to something that doesn't change the function argument?

I think something like: 
mcast_members = 0;
if (port_mask) {
	mcast_members = cpsw_ale_get_port_mask(ale_entry,
											ale->port_mask_bits);
	mcast_members &= ~port_mask;
}
if (mcast_members)
	cpsw_ale_set_port_mask(ale_entry, mcast_members, ....)
else
	cpsw_ale_set_entry_type(....)

is more readable?

Thanks
/Ilias
