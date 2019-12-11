Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEA811A5A6
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 09:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfLKIMG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 03:12:06 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:48712 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfLKIMG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 03:12:06 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1iex6J-0006iw-38; Wed, 11 Dec 2019 16:12:03 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1iex6H-0006X3-99; Wed, 11 Dec 2019 16:12:01 +0800
Date:   Wed, 11 Dec 2019 16:12:01 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org, ard.biesheuvel@kernel.org
Subject: Re: [PATCHv2 00/22] crypto: omap-sham: fixes towards 5.5
Message-ID: <20191211081201.xry3awnqtc7i6rhh@gondor.apana.org.au>
References: <20191105140111.20285-1-t-kristo@ti.com>
 <ed703784-a035-fda2-51f6-869daf3cacbd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed703784-a035-fda2-51f6-869daf3cacbd@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Dec 11, 2019 at 10:06:41AM +0200, Tero Kristo wrote:
>
> Herbert, are you planning to pick these for 5.6? These apply cleanly on top
> of 5.5-rc1.

Sorry, I had dropped them because I thought they depended on the
crypto_wait_req patch.  I see now that there is no dependency.

I'll add them to this week's batch.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
