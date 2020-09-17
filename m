Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AC726E4A4
	for <lists+linux-omap@lfdr.de>; Thu, 17 Sep 2020 20:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgIQSxv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Sep 2020 14:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgIQSxq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Sep 2020 14:53:46 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D82DC06174A;
        Thu, 17 Sep 2020 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=YmDVFHDpizYc/TwnnkFHJuvq4HZQyroxl/6sftZyOfg=; b=yo2ThNdDFBBSofow6/GUT6znO
        AV6up04hQxQ87JSuwyBsYZ6cPA40Jyx7/h7ugIDDAyxGQuxpPb7h5RlTXju5lRqwNwH3Fjtcjriq2
        2Y2Ot122hkB0c8aWhxQrgYjG80j2F5sIUEsORGJiB2kK1NYmSxCzSWwiHMsw747ECXq0qsnP05pjU
        /uU6Kplfx0ojCnVoas3BJbwS+VAr2GmyiBXJHhn477cic+DTVgN3eO/PfKEqRXHH9HZAPhIG8WSKx
        ObsOX+yk+sxyxrx9eX608uRInho4bEz9J93gW/BvXdNi7EZUjRuENs8kmXOTAYqZhDjd1PkACkjEB
        DwbP5k/MA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34896)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kIz2K-00065q-UW; Thu, 17 Sep 2020 19:53:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kIz2K-0005xj-Ax; Thu, 17 Sep 2020 19:53:40 +0100
Date:   Thu, 17 Sep 2020 19:53:40 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM/footbridge: switch to use dma_direct_set_offset
 for lbus DMA offsets
Message-ID: <20200917185340.GC1559@shell.armlinux.org.uk>
References: <20200917173229.3311382-1-hch@lst.de>
 <20200917173229.3311382-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917173229.3311382-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 17, 2020 at 07:32:27PM +0200, Christoph Hellwig wrote:
>  static int __init cats_pci_init(void)
>  {
> -	if (machine_is_cats())
> -		pci_common_init(&cats_pci);
> +	if (!machine_is_cats())
> +		return 0;
> +	bus_register_notifier(&pci_bus_type, &footbridge_pci_dma_nb);
> +	pci_common_init(&cats_pci);

I'd prefer these things to retain a positive-logic construct, so:

	if (machine_is_cats()) {
		bus_register_notifier(&pci_bus_type, &footbridge_pci_dma_nb);
		pci_common_init(&cats_pci);
	}

It's the same number of lines.

Otherwise, I think it's fine. I'll try to find some spare time to give
it a go on a Netwinder.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
