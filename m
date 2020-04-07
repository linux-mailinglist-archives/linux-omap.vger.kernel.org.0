Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC911A1377
	for <lists+linux-omap@lfdr.de>; Tue,  7 Apr 2020 20:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDGSTa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Apr 2020 14:19:30 -0400
Received: from mx1.esisar.grenoble-inp.fr ([195.220.36.33]:60414 "EHLO
        mx1.esisar.grenoble-inp.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726420AbgDGSTa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Apr 2020 14:19:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by mx1.esisar.grenoble-inp.fr (Postfix) with ESMTP id EA933EC02ED;
        Tue,  7 Apr 2020 20:09:20 +0200 (CEST)
Received: from mx1.esisar.grenoble-inp.fr ([127.0.0.1])
        by localhost (mx1.esisar.grenoble-inp.fr [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id m9APpyRZsfo4; Tue,  7 Apr 2020 20:09:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by mx1.esisar.grenoble-inp.fr (Postfix) with ESMTP id 26766EC02F6;
        Tue,  7 Apr 2020 20:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx1.esisar.grenoble-inp.fr 26766EC02F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etu.esisar.grenoble-inp.fr;
        s=29808A28-1FE8-11E5-B58B-F10B7632C813; t=1586282960;
        bh=gaXXUIjVyS6ymmxfNpkm2DgmfQUxGNunQGQNUwoLjnQ=;
        h=Date:From:Message-ID:MIME-Version;
        b=LxGkTI9uK8POieStx5oWF0AmwzU9unjE/kWHU/+JbF/PkvXGo7lfMGoaOlBLljagn
         JZgl/yCkR+MMWdztCy05x8+vbO5R/38x/2ztpHtlgd4CFdxpBiXXjx5eXvCQ+1GCVA
         A7HS3TBAo5fDyox15VTR+JDaV/5iqmtUu5UZKqks=
X-Virus-Scanned: amavisd-new at mx1.esisar.grenoble-inp.fr
Received: from mx1.esisar.grenoble-inp.fr ([127.0.0.1])
        by localhost (mx1.esisar.grenoble-inp.fr [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id DSzARNEQXXOg; Tue,  7 Apr 2020 20:09:19 +0200 (CEST)
Received: from srv-zimbra.esisar.grenoble-inp.fr (unknown [172.21.100.139])
        by mx1.esisar.grenoble-inp.fr (Postfix) with ESMTPS id 3FF70EC01E4;
        Tue,  7 Apr 2020 20:09:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by srv-zimbra.esisar.grenoble-inp.fr (Postfix) with ESMTP id DC1501EC27C8;
        Tue,  7 Apr 2020 20:09:18 +0200 (CEST)
Received: from srv-zimbra.esisar.grenoble-inp.fr ([127.0.0.1])
        by localhost (srv-zimbra.esisar.grenoble-inp.fr [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id JJCd_K_So2yd; Tue,  7 Apr 2020 20:09:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by srv-zimbra.esisar.grenoble-inp.fr (Postfix) with ESMTP id 201811EC2799;
        Tue,  7 Apr 2020 20:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-zimbra.esisar.grenoble-inp.fr 201811EC2799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etu.esisar.grenoble-inp.fr;
        s=29808A28-1FE8-11E5-B58B-F10B7632C813; t=1586282957;
        bh=gaXXUIjVyS6ymmxfNpkm2DgmfQUxGNunQGQNUwoLjnQ=;
        h=Date:From:Message-ID:MIME-Version;
        b=ObkaR1/Jlhp5kuddl2t65bueDgiTxObmKbffJVDoXHlDAaodK9pkPlTXZmZzZqW+r
         YL9jl2e1XCXYwOQl8QvOM6PQdL1USOW9vdkDrPdgBbbu9FR3wpafkvRMe1l4Z4fhly
         BqX1SZLiGqIwFenAc0LMv7xUuhGWNTX02aMC5LgA=
X-Virus-Scanned: amavisd-new at srv-zimbra.esisar.grenoble-inp.fr
Received: from srv-zimbra.esisar.grenoble-inp.fr ([127.0.0.1])
        by localhost (srv-zimbra.esisar.grenoble-inp.fr [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id RGtIKJfPS6YL; Tue,  7 Apr 2020 20:09:16 +0200 (CEST)
Received: from srv-zimbra.esisar.grenoble-inp.fr (srv-zimbra.esisar.grenoble-inp.fr [172.21.100.139])
        by srv-zimbra.esisar.grenoble-inp.fr (Postfix) with ESMTP id 5E5881EC2786;
        Tue,  7 Apr 2020 20:09:11 +0200 (CEST)
Date:   Tue, 7 Apr 2020 20:09:11 +0200 (CEST)
From:   Rashid Al-Naimi <barkev.mahseredjian@etu.esisar.grenoble-inp.fr>
Reply-To: Rashid Al-Naimi <foundationqatar2@gmail.com>
Message-ID: <690521968.626406.1586282951357.JavaMail.zimbra@etu.esisar.grenoble-inp.fr>
Subject: Congratulations!!! Confirm Mail Receipt Asap.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.21.200.35]
X-Mailer: Zimbra 8.8.11_GA_3799 (zclient/8.8.11_GA_3799)
Thread-Index: Dm/9DxyaCBnAMmswjpIOaS2cZrLU3w==
Thread-Topic: Congratulations!!! Confirm Mail Receipt Asap.
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Beneficiary,

You have been awarded the sum of (&euro;990,000.00) from the Qatar Foundation, kindly reply with your name and address for more information.

Sincerely,
Rashid Al-Naimi
Email: foundationqatar2@gmail.com
