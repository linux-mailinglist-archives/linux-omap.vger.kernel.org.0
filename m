Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 387A910DD72
	for <lists+linux-omap@lfdr.de>; Sat, 30 Nov 2019 12:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfK3L2Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 30 Nov 2019 06:28:16 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43517 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfK3L2Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 30 Nov 2019 06:28:16 -0500
Received: by mail-pf1-f194.google.com with SMTP id h14so5730168pfe.10
        for <linux-omap@vger.kernel.org>; Sat, 30 Nov 2019 03:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iai8gOE3z1MAnydfDZ/hmRICotLqvoUpCxmpbWuvdhk=;
        b=zKRu7RrhrkiEUyF3rwVCcli7TCk2GVVka+2HLae++qjdDgoW5ghKokWGbfEKpWKDeE
         IRO//NDvRDaIw17ehPbk139sjc5jOYG02HIePBbsIbdhv3CqZVl/bca9PDgqAxX4TNtm
         3hw8q2Un1Bdv7oyXcuaphFIuqi4oTwHQRKMUN/Bxxi0MGj2v87zPVJdHeWQyz9RFhILw
         Pv/iTTnxZnIxGQyq5db6gFK9EIDxDQHgsac7IFqK6ywlL0l/PZae9vAPvHJkvG8m7dp3
         j2OgR4Z1Z5lt7OCqIcq52E5I7A/8mnYiTxMB3MHxeAW6V0Kmcx+9D35zVl/5foOVG1tq
         J7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iai8gOE3z1MAnydfDZ/hmRICotLqvoUpCxmpbWuvdhk=;
        b=FNjwTsxG3UqJGoGkc7gvm9KMml1Lv9BgG8mtSuQ4QVwhrX4yjW91PBuTCTINe9EMQO
         d/rnH/vvw88tTC6qHqrip7YJ8qpPCYV7I0oofsGnahC6UiB7nU6+oxF3vA5b9ee+y5ce
         29GiNGBHKIRPIgs6gBE/Rbr3ErnX9CIDBr9kh4sckSnRHTeQKVSWLBI6W4FpBn+4xU/E
         82TKFMf9b6egENNsSV91VxoKYJo9XsmQfr5FeYzOf+k/N7O0DByw2o6Sf3STn4jFVpg1
         l44fRLRcyYvAKka7yA1nAgt8wkqi+T7ytQJkbnwDjKTk6dx2Os3bjChzxEePh1GYdRKM
         y2xQ==
X-Gm-Message-State: APjAAAU19Gpbv2gm3UzsRY23os3iT7JuUkmocIHiaPpfpDqYhMn2G7Rk
        rx+5RPbwAY7dZt9K8hU1SfnFWg==
X-Google-Smtp-Source: APXvYqyG+ZhxvFRKoPJOQAjOuPGebTseFZQpHs4mycCxOnX53ohMvPGcUywJyK7N+GOAVkAq+GTdAA==
X-Received: by 2002:a63:1c5c:: with SMTP id c28mr21374323pgm.241.1575113295143;
        Sat, 30 Nov 2019 03:28:15 -0800 (PST)
Received: from Iliass-MacBook-Pro.local ([50.225.178.238])
        by smtp.gmail.com with ESMTPSA id 39sm18732330pjo.7.2019.11.30.03.28.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Nov 2019 03:28:14 -0800 (PST)
Date:   Sat, 30 Nov 2019 03:28:12 -0800
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>, Sekhar Nori <nsekhar@ti.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] net: ethernet: ti: ale: ensure vlan/mdb deleted when
 no members
Message-ID: <20191130112812.GA2779@Iliass-MacBook-Pro.local>
References: <20191129175809.815-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129175809.815-1-grygorii.strashko@ti.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 29, 2019 at 07:58:09PM +0200, Grygorii Strashko wrote:
> The recently updated ALE APIs cpsw_ale_del_mcast() and
> cpsw_ale_del_vlan_modify() have an issue and will not delete ALE entry even
> if VLAN/mcast group has no more members. Hence fix it here and delete ALE
> entry if !port_mask.
> 
> The issue affected only new cpsw switchdev driver.
> 
> Fixes: e85c14370783 ("net: ethernet: ti: ale: modify vlan/mdb api for switchdev")
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  drivers/net/ethernet/ti/cpsw_ale.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index 929f3d3354e3..ecdbde539eb7 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -384,7 +384,7 @@ int cpsw_ale_del_mcast(struct cpsw_ale *ale, const u8 *addr, int port_mask,
>  		       int flags, u16 vid)
>  {
>  	u32 ale_entry[ALE_ENTRY_WORDS] = {0, 0, 0};
> -	int mcast_members;
> +	int mcast_members = 0;
>  	int idx;
>  
>  	idx = cpsw_ale_match_addr(ale, addr, (flags & ALE_VLAN) ? vid : 0);
> @@ -397,11 +397,13 @@ int cpsw_ale_del_mcast(struct cpsw_ale *ale, const u8 *addr, int port_mask,
>  		mcast_members = cpsw_ale_get_port_mask(ale_entry,
>  						       ale->port_mask_bits);
>  		mcast_members &= ~port_mask;
> +	}
> +
> +	if (mcast_members)
>  		cpsw_ale_set_port_mask(ale_entry, mcast_members,
>  				       ale->port_mask_bits);
> -	} else {
> +	else
>  		cpsw_ale_set_entry_type(ale_entry, ALE_TYPE_FREE);
> -	}
>  
>  	cpsw_ale_write(ale, idx, ale_entry);
>  	return 0;
> @@ -478,6 +480,10 @@ static void cpsw_ale_del_vlan_modify(struct cpsw_ale *ale, u32 *ale_entry,
>  	members = cpsw_ale_get_vlan_member_list(ale_entry,
>  						ale->vlan_field_bits);
>  	members &= ~port_mask;
> +	if (!members) {
> +		cpsw_ale_set_entry_type(ale_entry, ALE_TYPE_FREE);
> +		return;
> +	}
>  
>  	untag = cpsw_ale_get_vlan_untag_force(ale_entry,
>  					      ale->vlan_field_bits);
> -- 
> 2.17.1
> 

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
