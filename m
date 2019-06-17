Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B476748380
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2019 15:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbfFQNHh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Jun 2019 09:07:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:38044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbfFQNHh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Jun 2019 09:07:37 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25B9720861;
        Mon, 17 Jun 2019 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560776856;
        bh=YEze8d0ugX/o37Qat8tEvyzluGQMF4GPJRGRLiubo7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T8IcNFQif6dtxeAQFZKGxX3KZE+HknYXD1IUtwMVufd9JJqg7lIVaSVTEjJir+Rab
         SuMnirjeUS+oQBFYUxHnUQhxHi58+DwOwEdO1D9ysmVnAOAziOQszhXuyYVHA9lUZ+
         rMqfHFhPYT1DTT3aoqSd64zw4agHKe7c7Ldjsw8Y=
Date:   Mon, 17 Jun 2019 15:07:34 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Paul Walmsley <paul@pwsan.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH, for GregKH] ARM: omap1: remove unused variable
Message-ID: <20190617130734.GA15784@kroah.com>
References: <20190617125521.1553103-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617125521.1553103-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 17, 2019 at 02:55:02PM +0200, Arnd Bergmann wrote:
> The cleanup of the debugfs functions left one variable behind that
> should now be removed as well:
> 
> arch/arm/mach-omap1/clock.c:1008:6: error: unused variable 'err' [-Werror,-Wunused-variable]
> 
> Fixes: d5ddd5a51726 ("arm: omap1: no need to check return value of debugfs_create functions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-omap1/clock.c | 1 -
>  1 file changed, 1 deletion(-)

Oops, sorry about that, odd that 0-day never reported it :(

I'll go queue this up now, thanks.

greg k-h
