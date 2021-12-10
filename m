Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5B646FE0D
	for <lists+linux-omap@lfdr.de>; Fri, 10 Dec 2021 10:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbhLJJpQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 04:45:16 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43480 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231864AbhLJJpQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Dec 2021 04:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=doSnLVpzSvaqr4NQDA9GRIBQZJwxqvyFpOIBYgu6rFQ=; b=agOAwplekXMeKfH70GxdYHYqg6
        6f6ocNXPadmgPd3l6OkV+gxa2Y01TfZjNyS0yuYNBC1Sat5iziif2K3lWt0ngom/wFaMKMeF+dwz1
        wIwwRDqfz0ag/NB4uE0hmedH529sLXdKsnrnheGfO4l0Y+EKuZJuNLfkulZyl0lVRF9Tq2IyPBZGQ
        JhjSEZoCyTaLNMYLPdLIiQTGbpAgkkqPeQzgHr3uoQHVciMU1YfCg6pVF1Htedqh0rtpsOz5uYR4H
        zPNBbm/v4prqntYfdylyxcNXb6qrKZ5XVsVeVfBKgdY86Lrx8P/GQIR9egGKP0Fq/QRlm2ecMqYcL
        J1vNDqIw==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mvcP9-0000OP-7Z; Fri, 10 Dec 2021 09:41:27 +0000
Subject: Re: Nokia N900 not hitting OFF mode since 5.9 is caused by proactive
 memory compaction
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Nitin Gupta <nigupta@nvidia.com>
References: <99e25c92-3d2d-0964-0068-651bf44cbf8a@wizzup.org>
 <YbL/teuB7qtGhtfL@atomide.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Message-ID: <102ac103-83e9-6f64-b209-4d238c0a2893@wizzup.org>
Date:   Fri, 10 Dec 2021 10:47:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YbL/teuB7qtGhtfL@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 10/12/2021 08:20, Tony Lindgren wrote:
> 
> Not sure if sysctl -w vm.compaction_proactiveness=0 is enough to disable
> compaction for idle, maybe also the HPAGE_FRAG_CHECK_INTERVAL_MSEC = 500
> at ms also causes extra wake-ups?

I remember trying setting vm.compaction_proactiveness to 0 and it didn't
help with idling, and my thought was also that the check-interval was
still active.

Cheers,
Merlijn
