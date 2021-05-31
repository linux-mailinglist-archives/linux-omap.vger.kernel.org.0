Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5001395AC4
	for <lists+linux-omap@lfdr.de>; Mon, 31 May 2021 14:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhEaMmg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 May 2021 08:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhEaMmf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 May 2021 08:42:35 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BECC06174A
        for <linux-omap@vger.kernel.org>; Mon, 31 May 2021 05:40:55 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id e18so758968eje.5
        for <linux-omap@vger.kernel.org>; Mon, 31 May 2021 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ttuw3hsf4YxeZMycfcnVZ0YWPo6I8YVRYx8bFrmCmew=;
        b=e2wH5kGNbqmM7sqLYI5fQsr18899D02yrUr+wUZ8XhpefVc2GwL9VQm6B/awlV/BH5
         CDGnTQTwXLwKliatmQYXM1Mq2MrsaebQNfs2aFzNdCdZbSNQyW1ubswNTABfpWphsUGq
         VFG7IlBTe56f7CPS4YHIQ5bMgxYoj53locMnEFtlAuC8/bsFxOe+SnO+A+HkXp5ta5ta
         HGxsDHnQHfWfr+WO+DzUsM7i0Cem8SvQ5Bb38GIkI5Qc3CN7Np4YATxwN8jDhGU2otRJ
         KRvNm32yegy4rG+io1LWaJC0l8RFDV3CooRydkGo//oVPr46aJN0ofYiEWQs7A++z4p9
         ALsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ttuw3hsf4YxeZMycfcnVZ0YWPo6I8YVRYx8bFrmCmew=;
        b=Ctz5ATmx4HEPOEfPsXDdTKpc2ePccTJtWGTwYHOw8QRqpC15V39vMZOPv6l45uOvBR
         anbW1+ioaexyt6m7C9TwavBCL9Kuphw8YTE9vNebtfm9jV6t3vUE3GPKEEHjdTtNEda9
         b/sYzxr2o27Iohi1dRgc1cZW3LVWr+o/Dxn0lwnWyiVAtk2Ny8oGrB63ZIMK8jUpfGd6
         DFiDjHk/EAP5qsKOb9PBhNDbNcq7oWX2o5K0sAhW22fT8HBE99NFO2DS0q5es1+B+3t3
         AHo7PFUKMkivdLNC53VQSNhjtJ2eGt99FevEPf0RdUnxnkGnD7Z0m04Dn1Le7g5NMZ9v
         4Ojg==
X-Gm-Message-State: AOAM533gK+ptJPOWl8fT1GEU+SDlEh0zGqO2zeNsppOpR1Fq3vB4Deo0
        ZF0NVstOVAtAx7PDtL7FhMX9hg==
X-Google-Smtp-Source: ABdhPJzb48hjJetSFuBk99goox+JTEHL5gJlbQp0AaYb5lIUspxH3uDeLrPOU6bgLPFF4YzQ2u3sEQ==
X-Received: by 2002:a17:906:495:: with SMTP id f21mr4444827eja.510.1622464854372;
        Mon, 31 May 2021 05:40:54 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id md23sm105434ejb.110.2021.05.31.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 05:40:54 -0700 (PDT)
Date:   Mon, 31 May 2021 14:40:52 +0200
From:   Ben Hutchings <ben.hutchings@essensium.com>
To:     netdev@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>
Subject: Ethernet padding - ti_cpsw vs DSA tail tag
Message-ID: <20210531124051.GA15218@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I'm working on a system that uses a TI Sitara SoC with one of its
Ethernet ports connected to the host port of a Microchip KSZ8795
switch.  I'm updating the kernel from 4.14.y to 5.10.y.  Currently I
am using the ti_cpsw driver, but it looks like the ti_cpsw_new driver
has the same issue.

The Microchip switch expects a tail tag on ingress from the host port
to control which external port(s) to forward to.  This must appear
immediately before the frame checksum.  The DSA core correctly pads
outgoing skbs to at least 60 bytes before tag_ksz appends the tag.

However, since commit 9421c9015047 ("net: ethernet: ti: cpsw: fix min
eth packet size"), the cpsw driver pads outgoing skbs to at least 64
bytes.  This means that in smaller packets the tag byte is no longer
at the tail.

It's not obvious to me where this should be fixed.  Should drivers
that pad in ndo_start_xmit be aware of any tail tag that needs to be
moved?  Should DSA be aware that a lower driver has a minimum size >
60 bytes?

Ben.
