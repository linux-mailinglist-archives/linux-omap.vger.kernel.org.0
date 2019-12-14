Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 640D311F2BD
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2019 17:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfLNQDe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Dec 2019 11:03:34 -0500
Received: from delivery.mailspamprotection.com ([108.178.13.118]:35873 "EHLO
        delivery.mailspamprotection.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbfLNQDe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Dec 2019 11:03:34 -0500
X-Greylist: delayed 3218 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Dec 2019 11:03:33 EST
Received: from ns1.sgp65.siteground.asia ([77.104.150.195] helo=sgp65.siteground.asia)
        by se11.mailspamprotection.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <fantasie@fantasiechocolate.com>)
        id 1ig936-0000tN-NZ; Sat, 14 Dec 2019 09:09:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=fantasiechocolate.com; s=default; h=Reply-To:Date:From:To:Subject:
        Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
        Sender:Message-ID:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=G9LTS5QPxJ/s89LVw4V0N76a9Lg4GJG1FaRG84gTZKM=; b=VC6sIkzvVQNADIA7GQOkDd/52
        ggzYeN2dqZN/ofNvvX+qvrkn5rrS1Z7U//NVIm11cJHrJRuIdb8gOpQxHJQzy/ZR1/2FkCDt4pHmz
        ZNnvD/aY37M94g6IzDSQfaAWGYCmJSQ1Wz3amHKCe8iceR3yO69bgqpp2bB51XrX0ToxQZY/wzC1y
        ATEXqX595nu6/TuNZ7o88xhiACR37UJO7ELjyQ4heVJEfoEJUv3fdN8TWabyYUwmhUR2+/5L/EwKf
        qHNK1+uBUh6+U2AG4fqUs8SPTOBD7ST78l1teKjoVXARPGpU6ksfW5fX0ZpXpXOzLZidoiUACfA+s
        k1BYpGcPw==;
Received: from [41.215.171.102] (port=62564 helo=[192.168.1.2])
        by sgp65.siteground.asia with esmtpa (Exim 4.90devstart-1178-b07e68e5-XX)
        (envelope-from <fantasie@fantasiechocolate.com>)
        id 1ig8yI-0008ta-VQ; Sat, 14 Dec 2019 23:04:43 +0800
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Hello
To:     Recipients <fantasie@fantasiechocolate.com>
From:   fantasie@fantasiechocolate.com
Date:   Sat, 14 Dec 2019 10:04:18 -0500
Reply-To: jackharg231@gmail.com
Message-ID: <E1ig936-0000tN-NZ@se11.mailspamprotection.com>
X-Originating-IP: 77.104.150.195
X-SpamExperts-Domain: sgp65.siteground.asia
X-SpamExperts-Username: 77.104.150.195
Authentication-Results: mailspamprotection.com; auth=pass smtp.auth=77.104.150.195@sgp65.siteground.asia
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fi3oD8HEy9ysrsB6Ile+oipSDasLI4SayDByyq9LIhVUZbR67CQ7/vm
 /hHDJU4RXkTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KhN8gB0UCtlKiDADMEO6fK0gH
 UgOfZ93V5covVEKqb0Y3BEaqsouyH2JPupaK4GdPPybLiQyRWum4Qke8JxDXt1GbeR5Rzr89R6i1
 5BJmT4c+svYr+DKXW6ffa59udrIX25giF9M7gJWAl/5nWJMtsPOll4f8kWZfbm7sEYD22JZeXjSp
 e3EPxcXRtJI70mhcpTqYQPoSw+uNgEPriCGGVktqqLQymt9ING1BZ9RAzU4r8WCGjuRR5BR5UDHw
 q13WBSxNOxzIPy1yQgtYqFzVHklVTnyPbFIuz6vVj3T6m6r2YUxT5afkS4OQilu1kinw4pWx7WxW
 FZpsjT/483ewgkWc4Mj+Q5mgf/xICRyR+RsuZ776uHuZaALzAKY8BmR1kxi2g6kxhuc2EktXlSJd
 dD6qZfoa3cy5onUGweCshQjEOygmVS8JNKEmMM5/Gwy3sp2u/+Dor0gguhZcVyh35PmAFwfCxkjc
 ZVHQ0okDst0lYcj4qaoz9norxIpK8WLiKdvTyBjtn1YZtaf24ZD2cbVJ3Fsp+X0HS6wzEu9olBd2
 /rQUHM2a3mox2M6n7Xb3mr89pv0YVQhC/Sp+XTdU8H7KNmzQeIjNKbtlrCkjPH2q67EvYVcsvQ34
 /NpuC88kNvRysn3lfZb4Rh+NqdC24dfD1D/d23d0xFdIJfiwViUKVDwra/DXU8hrrqrGi9pLnoJT
 WK100RUrXmQxQp+Y8uvNceQr1UI+HGSmnZmh3dLfX8TdqEXkwxwMjsp2mNApQ95Gxa8k8I6yQov8
 irQyyWWLX2ZbQb3UJKihEmoDuwjmTt0o0URDpBDAYhtJF4FPxMG6ogEEFop6lsYs6JBvdSZM8t9f
 CBMU12l3eZ1CzYj74O4hBSz/kkmPgL+fgIguBNIsbfC/jLbTnTJbC5t39nmvH1DYfgO7D7Y/JGCD
 42O8zzKH2hQ3Ve2IDXy4YSwRw+auFRhe1Qs4yVlUek1P6W8HBTQAa2fFODpNGvpEAjBzLXMKZiSm
 G+e9rsu95C3S0z6bhalFEM/pjPCQA+BAlp145fqpIMTjFaaDpGgnWLsIznNk2ibb5YJRIe0x6YKX
 8/j3T3ybaeC3MilL8EjWDVq0GNHGMUW6YkpwbFLasFYccBIk1Sag4dKiqCrF8eZZLd8WBKFLv720
 D3T9ClsPTExvHlDG2Kbv6n8NmuDa7S7jfpMZETSvJYWeM1Y3FciG4HpLXvodlY2FrSxVsval1Owq
 eELuJMPl/O1OgZpZqTZmAnLGi91oUOJsJcYiUNN7nHl2TRtBFGxCwNLr/WIXTv8laQem01LZN5TP
 6r1b0vL67KzTDKX3XqBJUd3nXdesg89YagDPKq8U0dLahem93w==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Are you available?


Regards
Jack Hargreaves
Broker/Financial consortium
