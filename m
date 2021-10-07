Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F11425A2F
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 20:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243410AbhJGSCn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 14:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242977AbhJGSCm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Oct 2021 14:02:42 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF717C061570;
        Thu,  7 Oct 2021 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IvYUNBHe87N2UV2hqOHOkd/I2jVQb+ixxwyqeQZ6J7s=; b=ZlH8EaZGnIhsPrECEC180CTMv5
        oiiUHk4qdo3HfcOXDxg1mBn2UG+QM58u9Has5AMqQqxmYnnDvylLdT94Sa3lWHScREXuT7n385a0L
        4asVaIwyhu+aydftoHk2hTKS+yyfc4MTswZui3Wa0JHn+Q3jta7C8h7KO0ZsIysc2f90=;
Received: from p200300ccff1124001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff11:2400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mYXh9-0004VK-DM; Thu, 07 Oct 2021 20:00:39 +0200
Date:   Thu, 7 Oct 2021 20:00:38 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Adam Ford <aford173@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] ARM: dts: omap36xx: Remove turbo mode for 1GHz
 variants
Message-ID: <20211007200038.58833d60@aktux>
In-Reply-To: <CAHCN7x+TdPb0UthQ9CeQL_sWwJmRK++M1kUXZVvCcj8anAFqRQ@mail.gmail.com>
References: <20210109170103.1249838-1-aford173@gmail.com>
        <20211001095404.41f73d88@aktux>
        <C0A84970-0AAC-42E7-8E0F-4D165F0C9551@goldelico.com>
        <CAHCN7x+TdPb0UthQ9CeQL_sWwJmRK++M1kUXZVvCcj8anAFqRQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 2 Oct 2021 07:12:05 -0500
Adam Ford <aford173@gmail.com> wrote:

> On Fri, Oct 1, 2021 at 4:59 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >
> >
> >  
> > > Am 01.10.2021 um 09:54 schrieb Andreas Kemnade <andreas@kemnade.info>:
> > >
> > > On Sat,  9 Jan 2021 11:01:03 -0600
> > > Adam Ford <aford173@gmail.com> wrote:
> > >  
> > >> Previously, the 1GHz variants were marked as a turbo,
> > >> because that variant has reduced thermal operating range.
> > >>
> > >> Now that the thermal throttling is in place, it should be
> > >> safe to remove the turbo-mode from the 1GHz variants, because
> > >> the CPU will automatically slow if the thermal limit is reached.
> > >>
> > >> Signed-off-by: Adam Ford <aford173@gmail.com>
> > >> ---
> > >> V2:  The orignal patch had the wrong file added. Add the omap36xx.dtsi
> > >>  
> > > hmm, I somehow expected that there is a revert of this thing going
> > > through. But now, the turbo-mode is still missing  
> >
> > tagging by turbo-mode means the OPP is *disabled* by default and
> > needs to be enabled actively.
> >  
> > > and I understood the
> > > revert is only in Nikolaus' trees.  
> >
> > It is just a revert for the gta04a5 because I think it is the only board
> > which is affected (maybe it would need SmartReflex in operation to
> > fine tune the OPPs compared to the generic table). Therefore I have
> > a patch which adds turbo-mode to the gta04a5.dts
> >  
> > > The 1Ghz mode was working for some
> > > time but does not anymore. Is it just me or do others also have the
> > > same problems?  
> >
> > That would be interesting to know.
> >  
> 
> What version are you seeing the break?  It's working for me on 5.15.y branch
> 
> # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
> 300000 600000 800000 1000000
> # uname -a
> Linux buildroot 5.14.9-00260-g70248e7b378b-dirty #1 SMP Sat Oct 2
> 06:56:02 CDT 2021 armv7l GNU/Linux
> #
> 

I see this one: I remember there was also a discussion about proper
handling of that but I do not remember the final result:

Author: H. Nikolaus Schaller <hns@goldelico.com>
Date:   Mon Dec 2 22:10:55 2019 +0100

    Revert "ARM: OMAP2+: Fix warnings with broken omap2_set_init_voltage()"
    
    This reverts commit cf395f7ddb9ebc6b2d28d83b53d18aa4e7c19701.
    
    This patch is in conflict with 1GHz OPP.




commit ae44b701fb6afb2be62defff590531e3b0632772
Author: H. Nikolaus Schaller <hns@goldelico.com>
Date:   Sat Apr 10 16:59:53 2021 +0200

    ARM: DTS: gta04a5: disable 1GHz OPP again because it is not reliable
    
    To enable on a running system:
    
    echo 1 >/sys/devices/system/cpu/cpufreq/boost
    
    The symptom can be spurious hangs and virtual paging error,
    kernel panics and strange things.

on top of 5.13-rcX in Nikolaus trees.

Regards,
Andreas
