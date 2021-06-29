Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72CB13B7949
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 22:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235154AbhF2U3Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 16:29:24 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42131 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233801AbhF2U3X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Jun 2021 16:29:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 88B235C00C1;
        Tue, 29 Jun 2021 16:26:55 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute4.internal (MEProxy); Tue, 29 Jun 2021 16:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slimlogic.co.uk;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm3; bh=Gz8V+dIp5N5rhQ8cVOeVw5jdR00H
        xQygA8dIoUoQs6g=; b=PaYuPOYh39dt0sMmJ5tXNylSiX5VLbYaxQGHLRYfvI58
        A9XlfLn3uwWWeoUaZfRmuAcVuhcnBAHPfabJsH5Wi8Srcn5viuzKsGwBdfmeU2VE
        tucIpGIMd8Kq98gR8hErbykSsEf1/SDxo6Qc5dEqz8GIEQrJZxGZcDjiTFAdoIZv
        JAttZyScEm1C1z5VPxVgXWG+9kFKE8lUL6FvtQmfCv7uSEF1/XAlK85JV21geo+p
        iaxhmynXSLW+U/CIUnSBLyYFd8wEoM08m44W7g65XJYLNXDVFeaZShcgZWNMGdQg
        Df4lBSY6JUUwx7LKGAKAJ+Qcyo0yrZKU7a7BWCfnRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Gz8V+d
        Ip5N5rhQ8cVOeVw5jdR00HxQygA8dIoUoQs6g=; b=NuZi6K7W7ooi0unaI2vyQx
        qNLHEau5yUq/482vwiFhyVIdqTnDCKqsJPFhy5AmCNFNe+b6pIhfs9g1SxnT846o
        eRxENyGtLn75gNJ8PuK25rwAURfQkU/ZHXDe3MxZ6e/RklmyxIpgqYMcSmhrDBgR
        ZkIkFVnTMy2yQn7hcgkXD2EN8U6IC1oz1wQ354vCRSWbVoQxDioHRtWL8E0ZipX4
        C9TY6Fooh9vn+/AMXB8fkrseY97zuyUbK5N2VxVkoXtiLnwrSciOHO++YcSWnUsr
        7GFBC28+ATCBwygnW9PijZJUDh0rBNBheRIPNKftrlDBDsO+zlJ6CMfOCs8zPj2g
        ==
X-ME-Sender: <xms:DoLbYD0jpnuVNhRIh4aBQk27E8B8aQFf9KicWlT8ATU4bEkAXhxGwg>
    <xme:DoLbYCHrl5MXhZP5zxIT3su8SzdeTLExOMfMyhw-VxqbTwQIy1rx8bkkbYKIvTEKx
    vMI770qtI_y6oCP-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfifhr
    rggvmhgvucfirhgvghhorhihfdcuoehgghesshhlihhmlhhoghhitgdrtghordhukheqne
    cuggftrfgrthhtvghrnhepgedtkefhieekteffgfetkeeftdehveekheelhfevhfegvedu
    vddvhffhieekieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhgsehslhhimhhlohhgihgtrdgtohdruhhk
X-ME-Proxy: <xmx:DoLbYD4bu6xXaxrnRIBRjohrRiBvU6LQSYFhg2ZsTxYuDoBP5dFBxA>
    <xmx:DoLbYI25L8xxIZOAwCFR_uPsytko_zVPbAGeq5Ei5Ws_aQRLNAyFMQ>
    <xmx:DoLbYGFzRmE981qiDwaUZV_S11uYUDqMYfdx9QwL9J5MEQ692Tx88A>
    <xmx:D4LbYL7RhjQajwrzsGYA0CJy5Z5IdVuKI3f_OnQJ32bP_VbEzg9XYA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 13953FA0063; Tue, 29 Jun 2021 16:26:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-530-gd0c265785f-fm-20210616.002-gd0c26578
Mime-Version: 1.0
Message-Id: <4269dfb2-dd38-4b13-94e7-8c6afe0ab22e@www.fastmail.com>
In-Reply-To: <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
 <20210629155922.GD4613@sirena.org.uk>
 <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
 <20210629185638.GG4613@sirena.org.uk>
 <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
Date:   Tue, 29 Jun 2021 21:26:33 +0100
From:   "Graeme Gregory" <gg@slimlogic.co.uk>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        "Mark Brown" <broonie@kernel.org>,
        "Tony Lindgren" <tony@atomide.com>
Cc:     "Liam Girdwood" <lgirdwood@gmail.com>,
        "Nishanth Menon" <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Discussions about the Letux Kernel" <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com,
        "Peter Ujfalusi" <peter.ujfalusi@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH]_regulator:_palmas:_set_supply=5Fname_after_registe?=
 =?UTF-8?Q?ring_the_regulator?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On Tue, 29 Jun 2021, at 9:21 PM, H. Nikolaus Schaller wrote:
> Hi Mark,
> 
> > Am 29.06.2021 um 20:56 schrieb Mark Brown <broonie@kernel.org>:
> > 
> > On Tue, Jun 29, 2021 at 08:34:55PM +0200, H. Nikolaus Schaller wrote:
> >>> Am 29.06.2021 um 17:59 schrieb Mark Brown <broonie@kernel.org>:
> > 
> > 
> >> So it was working fine without having the supplying regulator resolved. AFAIK they
> >> just serve as fixed regulators in the device tree and have no physical equivalent.
> > 
> > No, not at all - it's representing whatever provides input power to the
> > regulator.  There may be no physical control of it at runtime on your
> > system but that may not be true on other systems.  It's quite common for
> > there to be a chain of regulators (eg, DCDCs supplying LDOs) and then
> > they all need to get get power managed appropriately and you don't end
> > up thinking a regulator is enabled when the input regulator is disabled.  
> 
> Yes, that is how it is chained in other cases.
> 
> > 
> >> My proposal just moves setting the supply_name behind devm_regulator_register() and
> >> by that restores the old behaviour.
> > 
> > This means that we won't actually map the supply and any system that
> > relies on software handling the supply regulator will be broken.
> 
> Well, it seems as if the supply regulators are only vsys_cobra and 
> vdds_1v8_main.
> At least in omap5-board-common.dtsi which is what I can test.
> 
> Both are fixed regulators where calling enable or not doesn't become
> physically visible. The hardware still supplies the 5V and 1.8V to the palmas
> chip.
> 
> Maybe the new rule by commit 98e48cd9283dreveals a design issue inside of
> the Palmas driver which assumes that there is no need to control its supply
> regulators. And does not handle probe deferral.
> 
> Then of course my patch is just a work-around for a bug but not a solution.
> 
> > 
> >> Well, unless...
> > 
> >> ... devm_regulator_register() does something differently if desc->supply_name
> >> is not set before and changed afterwards. It may miss that change.
> > 
> > We resolve supplies during regulator registration, this would
> > effectively just skip mapping of the supply.
> > 
> >> So I hope for guidance if my approach is good or needs a different solution.
> > 
> > What I would expect to happen here would be that once vsys_cobra is
> > registered the regulators supplied by it can register and then all their
> > consumers would in turn be able to register.  You should look into why
> > that supply regulator isn't appearing and resolve that, or if a consumer
> > isn't handling deferral then that would need to be addressed.
> 
> Ah, I think I get an idea what may be going wrong.
> 
> There seems to be a deadlock in probing:
> 
> 	e.g. ldo3_reg depends on vdds_1v8_main supply
> 	vdds_1v8_main depends on smps7_reg supply
> 	smps7_reg depends on vsys_cobra supply
> 	vsys_cobra depends on nothing
> 
> This would normally lead to a simple chain as you described above. But
> ldo3_reg and smps7_reg share the same driver and can probe successfully or
> fail only in common.
> 
> Now if ldo3_reg defers probe through the new rule, smps7_reg is never
> probed successfully because it is the same driver. Hence vdds_1v8_main can
> not become available. And the Palmas continues to run in boot initialization
> until some driver (MMC) wants to switch voltages or whatever.
> 
> Maybe Tony or Graeme has an idea how to do it right...
> 
Sorry after almost 10 years I have forgotten all about this driver.

Graeme

