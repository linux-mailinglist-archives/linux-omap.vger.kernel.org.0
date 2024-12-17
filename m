Return-Path: <linux-omap+bounces-2835-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E0D9F4CF9
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 14:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94A147A7474
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 13:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5828A1F4737;
	Tue, 17 Dec 2024 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fU/TBeIj"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B51F4715;
	Tue, 17 Dec 2024 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734443840; cv=none; b=Ie4x0B24W0FfSTKYOt5v9mEmj/1B4HRiYgrkqjSPoGPSJgviAAtUga6PrSXeuYAOezHonGJhJWyMDB02VfrCYUq3c2GS7IAw1UaMfdGyRkcsZXbHxk46y17RxbdGzu+Net4U/5xoxLt6NAq3zVNbyRNEPz7z2J3/Qz7tw0yLs7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734443840; c=relaxed/simple;
	bh=8jhuuUsFhgIcpU5CNdxOmgUs9ECyvrSHIBwbvAp6G2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndCYMZQFrejKvSoK6QlDgFqheLXadHvhwRd0n1paagM4Xg+0PLeSiR9Bg+b/Du1mUEgpm6wtPy6hrRLkmabs0rNhV+YZUtxt9daoBS4LrdVUZJivPFgnyzfWhg/mxbihFQJQIWlMenglfxZ9EOjteGb4WngCoZ1uJnktEVWW06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fU/TBeIj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE888C4CED3;
	Tue, 17 Dec 2024 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734443839;
	bh=8jhuuUsFhgIcpU5CNdxOmgUs9ECyvrSHIBwbvAp6G2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fU/TBeIj6nl2eN6uNis3tw9dAcMeB7KgKc2w/LZQJNKrIcoGTCJJo5AVtjxwTixlP
	 r7qytg1cY2GERc2e8N44mAi9cNRjf4dnLv5SL0o7dQG3URiY61e1BqVkF3xSo0NdYy
	 fAoNDBJZ33o5WimoYZwVnlCQQai9cOplujo0DC4I=
Date: Tue, 17 Dec 2024 14:57:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Da Shi Cao <dscao999@hotmail.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: TI Ethernet Driver TI_K3_AM65_CPSW_NUSS
Message-ID: <2024121749-kerchief-treachery-aae6@gregkh>
References: <CY5PR10MB59880DDECD5D282B7665085B8C042@CY5PR10MB5988.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR10MB59880DDECD5D282B7665085B8C042@CY5PR10MB5988.namprd10.prod.outlook.com>

On Tue, Dec 17, 2024 at 01:40:12PM +0000, Da Shi Cao wrote:
> The driver of TI K3 ethernet port depends on PAGE_POOL configuration option. There should be a select PAGE_POOL under it configuration.
> 
> --- a/drivers/net/ethernet/ti/Kconfig
> +++ b/drivers/net/ethernet/ti/Kconfig
> @@ -114,6 +114,7 @@ config TI_K3_AM65_CPSW_NUSS
>         select TI_DAVINCI_MDIO
>         select PHYLINK
>         select TI_K3_CPPI_DESC_POOL
> +       select PAGE_POOL
>         imply PHY_TI_GMII_SEL
>         depends on TI_K3_AM65_CPTS || !TI_K3_AM65_CPTS
>         help
> 
> Dashi Cao


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

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

