Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CB037F984
	for <lists+linux-omap@lfdr.de>; Thu, 13 May 2021 16:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbhEMOSe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 May 2021 10:18:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:47974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234303AbhEMOSc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 May 2021 10:18:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 142CE610A0;
        Thu, 13 May 2021 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620915442;
        bh=oBkjwdnAfppQ79hZyBQaHyEMr254MTYht/meZLJAluw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KmdHvui9b1vt//AQbpZ9eeQe3jq/sS/C0dJY30OktwbqsTrj9obklyndGaeLR/9vq
         CUEDtaVMXYVlvGKyF+4TmIUUtcJOUH5UlexBtzdIOy3OqlVG7j/xp0inf0lKVF8TQq
         LwdZis/AHRiyufEqsYHs5M2PlqRg5yZMv0Snb024=
Date:   Thu, 13 May 2021 16:17:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
Message-ID: <YJ008MjjewRUTn9Z@kroah.com>
References: <20210511151955.28071-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511151955.28071-1-vigneshr@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 11, 2021 at 08:49:55PM +0530, Vignesh Raghavendra wrote:
> It is possible that RX TIMEOUT is signalled after RX FIFO has been
> drained, in which case a dummy read of RX FIFO is required to clear RX
> TIMEOUT condition. Otherwise, RX TIMEOUT condition is not cleared
> leading to an interrupt storm
> 
> Cc: stable@vger.kernel.org

How far back does this need to go?  What commit id does this fix?  What
caused this to just show up now vs. previously?

thanks,

greg k-h
