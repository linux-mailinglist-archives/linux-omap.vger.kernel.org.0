Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 425271A1360
	for <lists+linux-omap@lfdr.de>; Tue,  7 Apr 2020 20:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgDGSOZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Apr 2020 14:14:25 -0400
Received: from mx1.esisar.grenoble-inp.fr ([195.220.36.33]:59494 "EHLO
        mx1.esisar.grenoble-inp.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726684AbgDGSOZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Apr 2020 14:14:25 -0400
X-Greylist: delayed 325 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Apr 2020 14:14:25 EDT
Received: from localhost (localhost [127.0.0.1])
        by mx1.esisar.grenoble-inp.fr (Postfix) with ESMTP id C29E3EC029C;
        Tue,  7 Apr 2020 20:08:31 +0200 (CEST)
Received: from mx1.esisar.grenoble-inp.fr ([127.0.0.1])
        by localhost (mx1.esisar.grenoble-inp.fr [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id SJxieKmaGYRH; Tue,  7 Apr 2020 20:08:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by mx1.esisar.grenoble-inp.fr (Postfix) with ESMTP id 10BE7EC01E4;
        Tue,  7 Apr 2020 20:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx1.esisar.grenoble-inp.fr 10BE7EC01E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etu.esisar.grenoble-inp.fr;
        s=29808A28-1FE8-11E5-B58B-F10B7632C813; t=1586282907;
        bh=gaXXUIjVyS6ymmxfNpkm2DgmfQUxGNunQGQNUwoLjnQ=;
        h=Date:From:Message-ID:MIME-Version;
        b=oRn+CBCteef4z86PauOHuWgQ2+mcQT8xi+w2rEpiEJFqMDHPz1PHFyn2ddUZQ+ePm
         kuxDkOQjdRUBbAbhvnkC6MmbUsFa4EWfzTYUZRxW7OHXgjclTUkKxYgtigmZtwR/St
         y3ntnUHSfj4l/9TYnDY3Lp/tEkWAzX+GoCCyYDUI=
X-Virus-Scanned: amavisd-new at mx1.esisar.grenoble-inp.fr
Received: from mx1.esisar.grenoble-inp.fr ([127.0.0.1])
        by localhost (mx1.esisar.grenoble-inp.fr [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id OJdrYEFgZl7V; Tue,  7 Apr 2020 20:08:26 +0200 (CEST)
Received: from srv-zimbra.esisar.grenoble-inp.fr (unknown [172.21.100.139])
        by mx1.esisar.grenoble-inp.fr (Postfix) with ESMTPS id B6609EC0279;
        Tue,  7 Apr 2020 20:08:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by srv-zimbra.esisar.grenoble-inp.fr (Postfix) with ESMTP id 6C7AA1EC2730;
        Tue,  7 Apr 2020 20:08:19 +0200 (CEST)
Received: from srv-zimbra.esisar.grenoble-inp.fr ([127.0.0.1])
        by localhost (srv-zimbra.esisar.grenoble-inp.fr [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id kDfI7dMCAhID; Tue,  7 Apr 2020 20:08:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by srv-zimbra.esisar.grenoble-inp.fr (Postfix) with ESMTP id F41D91EC2747;
        Tue,  7 Apr 2020 20:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-zimbra.esisar.grenoble-inp.fr F41D91EC2747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etu.esisar.grenoble-inp.fr;
        s=29808A28-1FE8-11E5-B58B-F10B7632C813; t=1586282898;
        bh=gaXXUIjVyS6ymmxfNpkm2DgmfQUxGNunQGQNUwoLjnQ=;
        h=Date:From:Message-ID:MIME-Version;
        b=Nuv9IJoUZNy933RrnToX5KFBIJtOjt60lXmk1/N/7UPACbrj7Q67jP1PZaFWQ+h9R
         N1eSSFoIXabNv/Z3jy3Ky5MWOqlJE0c2AerQ7HlrOfq4sfcJUPxjs8PljJ8VkaOAKS
         Col9ykgC1hOEjWVWDt1cLZwhFLilx7WbS52F2mME=
X-Virus-Scanned: amavisd-new at srv-zimbra.esisar.grenoble-inp.fr
Received: from srv-zimbra.esisar.grenoble-inp.fr ([127.0.0.1])
        by localhost (srv-zimbra.esisar.grenoble-inp.fr [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id j-8TbP-jB7xa; Tue,  7 Apr 2020 20:08:17 +0200 (CEST)
Received: from srv-zimbra.esisar.grenoble-inp.fr (srv-zimbra.esisar.grenoble-inp.fr [172.21.100.139])
        by srv-zimbra.esisar.grenoble-inp.fr (Postfix) with ESMTP id 18F0C1EC23C5;
        Tue,  7 Apr 2020 20:08:12 +0200 (CEST)
Date:   Tue, 7 Apr 2020 20:08:12 +0200 (CEST)
From:   Rashid Al-Naimi <barkev.mahseredjian@etu.esisar.grenoble-inp.fr>
Reply-To: Rashid Al-Naimi <foundationqatar2@gmail.com>
Message-ID: <752599913.626113.1586282892065.JavaMail.zimbra@etu.esisar.grenoble-inp.fr>
Subject: Congratulations!!! Confirm Mail Receipt Asap.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.21.200.35]
X-Mailer: Zimbra 8.8.11_GA_3799 (zclient/8.8.11_GA_3799)
Thread-Index: GYF/l2mX7jmY+rvPuoZFTxPJRk2zyg==
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
