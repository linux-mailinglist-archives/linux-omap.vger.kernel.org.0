Return-Path: <linux-omap+bounces-16-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 342377F730D
	for <lists+linux-omap@lfdr.de>; Fri, 24 Nov 2023 12:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1255281DDE
	for <lists+linux-omap@lfdr.de>; Fri, 24 Nov 2023 11:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A25200A5;
	Fri, 24 Nov 2023 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QunT1pFA"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7F81EB58
	for <linux-omap@vger.kernel.org>; Fri, 24 Nov 2023 11:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA53FC433C7;
	Fri, 24 Nov 2023 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700826535;
	bh=rONuqkzfv7OVMDICs020cWoikJlqQwNfR2bb2s/gAyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QunT1pFAdaStG+bNcYI2Y9HFDdH8/p1toE1YBO4CQoK7s8CLGhXWWKhwhjyEfXDh6
	 3AqD2VEK9ZZxLjMSCyJWoLa7w1l3ODJFxztSEPcIVCiYFiHEnc3/gL0EOV6841VxJ4
	 13S5eQmEIBuGtgExhY75KmuiCXmp6yevzfu61xDw=
Date: Fri, 24 Nov 2023 11:48:53 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
	Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
	Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] bus: ti-sysc: Flush posted write only after srst_udelay
Message-ID: <2023112440-handiness-surely-6675@gregkh>
References: <20231124104133.19100-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124104133.19100-1-tony@atomide.com>

On Fri, Nov 24, 2023 at 12:41:33PM +0200, Tony Lindgren wrote:
> Commit 34539b442b3b ("bus: ti-sysc: Flush posted write on enable before
> reset") caused a regression reproducable on omap4 duovero where the ISS
> target module can produce interconnect errors on boot. Turns out the
> registers are not accessible until after a delay for devices needing
> a ti,sysc-delay-us value.
> 
> Let's fix this by flushing the posted write only after the reset delay.
> We do flushing also for ti,sysc-delay-us using devices as that should
> trigger an interconnect error if the delay is not properly configured.
> 
> Let's also add some comments while at it.
> 
> Fixes: 34539b442b3b ("bus: ti-sysc: Flush posted write on enable before reset")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/bus/ti-sysc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

