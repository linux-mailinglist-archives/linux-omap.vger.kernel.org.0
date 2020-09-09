Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915F026388E
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 23:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIIVhu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 17:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIIVht (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Sep 2020 17:37:49 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BEEC061573;
        Wed,  9 Sep 2020 14:37:48 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id CA9641298C8EB;
        Wed,  9 Sep 2020 14:20:59 -0700 (PDT)
Date:   Wed, 09 Sep 2020 14:37:45 -0700 (PDT)
Message-Id: <20200909.143745.677296596054433818.davem@davemloft.net>
To:     hns@goldelico.com
Cc:     pavel@ucw.cz, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        tony@atomide.com, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        guido.gunther@puri.sm, konradybcio@gmail.com, arnd@arndb.de,
        martin.botka1@gmail.com, community@tinkerphones.org,
        letux-kernel@openphoenux.org
Subject: Re: Mailing list about low levels of Linux on cellphones
From:   David Miller <davem@davemloft.net>
In-Reply-To: <A9E9E0CF-FCFA-4224-90CC-F3D2B718CFD0@goldelico.com>
References: <20200908225610.GA25399@duo.ucw.cz>
        <A9E9E0CF-FCFA-4224-90CC-F3D2B718CFD0@goldelico.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Wed, 09 Sep 2020 14:21:00 -0700 (PDT)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


I've created phone-devel@vger.kernel.org
